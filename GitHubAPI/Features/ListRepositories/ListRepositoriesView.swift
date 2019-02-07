//
//  ListRepositoriesView.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit
import Reusable
import UIScrollView_InfiniteScroll
import ToastSwiftFramework

protocol ListRepositoriesViewDelegate: class {
    func pullToRefresh()
    func fetchNewRepositories()
}

final class ListRepositoriesView: UIView {

    private var listDataSource: ListRepositoriesDataSource = ListRepositoriesDataSource()
    private var isPullToRefreshCalled: Bool = false
    private var isInfiniteRefreshCalled: Bool = false
    private weak var tryAgainDelegate: ErrorViewDelegate?
    public weak var delegate: ListRepositoriesViewDelegate?

    private var refreshControl: UIRefreshControl {
        let control = UIRefreshControl(frame: .zero)
        control.attributedTitle = NSAttributedString(string: "Fetching repositories...")
        control.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        return control
    }

    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(cellType: RepositoryCell.self)
        tableView.dataSource = listDataSource
        return tableView
    }()

    private(set) lazy var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .gray)
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()

    private(set) lazy var errorView: ErrorView = {
        return ErrorView(delegate: tryAgainDelegate, frame: .zero)
    }()

    init(tryAgainDelegate: ErrorViewDelegate? = nil, frame: CGRect = .zero) {
        super.init(frame: frame)

        self.tryAgainDelegate = tryAgainDelegate

        buildCodableView()
        addInfiniteScroll()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

extension ListRepositoriesView {

    func show(repositories: [Repository]) {
        if isPullToRefreshCalled {
            isPullToRefreshCalled = false
            isInfiniteRefreshCalled = false
            listDataSource.clear()
        }

        listDataSource.set(repositories)
        tableView.reloadData()
        tableView.finishInfiniteScroll()
        tableView.isHidden = false
        errorView.isHidden = true
    }

    func showLoading() {
        if isPullToRefreshCalled || isInfiniteRefreshCalled {
            return
        }

        loading.startAnimating()
        loading.isHidden = false
        errorView.isHidden = true
    }

    func hideLoading() {
        tableView.refreshControl?.endRefreshing()
        loading.stopAnimating()
        loading.isHidden = true
    }

    func showEmptyView() {
        errorView.set(message: "We cannot find results")
        tableView.finishInfiniteScroll()
        errorView.isHidden = false
        tableView.isHidden = true
    }

    func showErrorView(message: String) {
        if isPullToRefreshCalled || isInfiniteRefreshCalled {
            isPullToRefreshCalled = false
            isInfiniteRefreshCalled = false
            makeToast(message)
            tableView.finishInfiniteScroll()
            return
        }

        errorView.set(message: message)
        tableView.finishInfiniteScroll()
        errorView.isHidden = false
        tableView.isHidden = true
    }

    @objc
    func pullToRefresh() {
        isPullToRefreshCalled = true
        delegate?.pullToRefresh()
    }
}

extension ListRepositoriesView {

    func addInfiniteScroll() {
        tableView.addInfiniteScroll { [weak self] _ in
            self?.isInfiniteRefreshCalled = true
            self?.delegate?.fetchNewRepositories()
        }

        tableView.setShouldShowInfiniteScrollHandler { _ -> Bool in
            return true
        }
    }
}

extension ListRepositoriesView: CodableView {

    func buildHierarchy() {
        addSubview(tableView)
        addSubview(loading)
        addSubview(errorView)
    }

    func buildConstraints() {
        tableView.safeAreaTop(safeAreaView: self, statusBar: true)
        tableView.leftConstraint(parentView: self)
        tableView.rightConstraint(parentView: self)
        tableView.bottomConstraint(parentView: self)

        loading.centerYConstraint(parentView: self)
        loading.centerXConstraint(parentView: self)

        errorView.centerYConstraint(parentView: self)
        errorView.centerXConstraint(parentView: self)
    }

    func setup() {
        backgroundColor = .white
        tableView.refreshControl = refreshControl
    }
}
