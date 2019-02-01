//
//  RepositoriesCoordinator.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class RepositoriesCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listRepositoriesController = ListRespositoriesController()
        navigationController.pushViewController(listRepositoriesController, animated: true)
    }
}
