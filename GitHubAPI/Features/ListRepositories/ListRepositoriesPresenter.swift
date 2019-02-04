//
//  ListRepositoriesPresenter.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import Foundation

final class ListRespositoriesPresenter {
    
    weak private var listRepositoriesView: ListRepositoriesViewProtocol?
    
    func setView(_ view: ListRepositoriesViewProtocol) {
        listRepositoriesView = view
    }
    
    func fetchRepositories(from service: RepositoriesService) {
        listRepositoriesView?.showLoading()
        
        service.fetchRepositories(language: "swift", sort: "stars") { [weak self] result in
            self?.listRepositoriesView?.hideLoading()
            
            switch result {
            case let .success(repositories):
                guard !repositories.isEmpty else {
                    self?.listRepositoriesView?.showEmptyView(); return
                }
                
                self?.listRepositoriesView?.set(repositories)
                
            case let .failure(error):
                self?.listRepositoriesView?.showError(message: error.localizedDescription)
            }
        }
    }
}
