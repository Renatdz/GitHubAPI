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
    private let listRepositoriesPresenter: ListRespositoriesPresenter
    
    init(presenter: ListRespositoriesPresenter = ListRespositoriesPresenter()) {
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
    }
}

extension ListRespositoriesController: ListRepositoriesViewProtocol {
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError(message: String) {
        
    }
    
    func set(_ repositories: [String]) {
        
    }
    
    func showEmptyView() {
        
    }
}
