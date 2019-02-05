//
//  ListRepositoriesController.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ListRespositoriesController: UIViewController {
    
    private var listRepositoriesView: ListRepositoriesView = ListRepositoriesView()
    private let repositoriesService: RepositoriesService
    private let listRepositoriesPresenter: ListRespositoriesPresenter
    
    init(service: RepositoriesService, presenter: ListRespositoriesPresenter = ListRespositoriesPresenter()) {
        repositoriesService = service
        
        listRepositoriesPresenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListRespositoriesController {
    
    override func loadView() {
        super.loadView()
        
        listRepositoriesView = ListRepositoriesView(tryAgainDelegate: self)
        listRepositoriesView.delegate = self
        view = listRepositoriesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Repositórios"
        
        listRepositoriesPresenter.setView(self)
        listRepositoriesPresenter.fetchRepositories(from: repositoriesService)
    }
}

extension ListRespositoriesController: ListRepositoriesViewProtocol {
    
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

extension ListRespositoriesController: ListRepositoriesViewDelegate {
    
    func pullToRefresh() {
        listRepositoriesPresenter.fetchRepositories(from: repositoriesService)
    }
    
    func fetchNewRepositories() {
        listRepositoriesPresenter.fetchRepositoriesWithPagination(from: repositoriesService)
    }
}

extension ListRespositoriesController: ErrorViewDelegate {
    
    func tryAgain() {
        listRepositoriesPresenter.fetchRepositories(from: repositoriesService)
    }
}
