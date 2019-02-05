//
//  ListRepositoriesView.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit
import Reusable

final class ListRepositoriesView: UIView {
    
    private var listDataSource: ListRepositoriesDataSource = ListRepositoriesDataSource()
    private weak var tryAgainDelegate: ErrorViewDelegate?
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListRepositoriesView {
    
    func show(repositories: [Repository]) {
        listDataSource.set(repositories)
        tableView.reloadData()
        tableView.isHidden = false
        errorView.isHidden = true
    }
    
    func showLoading() {
        loading.startAnimating()
        loading.isHidden = false
        errorView.isHidden = true
    }
    
    func hideLoading() {
        loading.stopAnimating()
        loading.isHidden = true
    }
    
    func showEmptyView() {
        errorView.set(message: "Não achamos resultados")
        errorView.isHidden = false
        tableView.isHidden = true
    }
    
    func showErrorView(message: String) {
        errorView.set(message: message)
        errorView.isHidden = false
        tableView.isHidden = true
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
    }
}
