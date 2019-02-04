//
//  ListRepositoriesController.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ListRespositoriesController: UIViewController {
    
    private let listRepositoriesView: ListRepositoriesView = ListRepositoriesView()
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
        
    }
    
    func hideLoading() {
        
    }
    
    func showError(message: String) {
        
    }
    
    func set(_ repositories: [Repository]) {
        
    }
    
    func showEmptyView() {
        
    }
}
