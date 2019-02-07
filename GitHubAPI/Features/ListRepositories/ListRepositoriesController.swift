//
//  ListRepositoriesController.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ListRepositoriesController: UIViewController {

    private var listRepositoriesView: ListRepositoriesView = ListRepositoriesView()
    private let repositoriesService: RepositoriesService
    private(set) var listRepositoriesPresenter: ListRespositoriesPresenter

    init(service: RepositoriesService, presenter: ListRespositoriesPresenter = ListRespositoriesPresenter()) {
        repositoriesService = service

        listRepositoriesPresenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

extension ListRepositoriesController {

    override func loadView() {
        listRepositoriesView = ListRepositoriesView(tryAgainDelegate: self)
        listRepositoriesView.delegate = self
        view = listRepositoriesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Repositories"

        listRepositoriesPresenter.setView(self)
        listRepositoriesPresenter.fetchRepositories(from: repositoriesService)
    }
}

extension ListRepositoriesController: ListRepositoriesViewProtocol {

    func showLoading() {
        listRepositoriesView.showLoading()
    }

    func hideLoading() {
        listRepositoriesView.hideLoading()
    }

    func showError(message: String) {
        listRepositoriesView.showErrorView(message: message)
    }

    func set(_ repositories: [Repository]) {
        listRepositoriesView.show(repositories: repositories)
    }

    func showEmptyView() {
        listRepositoriesView.showEmptyView()
    }
}

extension ListRepositoriesController: ListRepositoriesViewDelegate {

    func pullToRefresh() {
        listRepositoriesPresenter.fetchRepositories(from: repositoriesService)
    }

    func fetchNewRepositories() {
        listRepositoriesPresenter.fetchRepositoriesWithPagination(from: repositoriesService)
    }
}

extension ListRepositoriesController: ErrorViewDelegate {

    func tryAgain() {
        listRepositoriesPresenter.fetchRepositories(from: repositoriesService)
    }
}
