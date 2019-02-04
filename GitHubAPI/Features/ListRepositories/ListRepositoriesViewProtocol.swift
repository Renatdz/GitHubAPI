//
//  ListRepositoriesViewProtocol.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

protocol ListRepositoriesViewProtocol: class {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func set(_ repositories: [Repository])
    func showEmptyView()
}
