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
}
