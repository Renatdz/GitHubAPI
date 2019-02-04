//
//  RepositoriesCoordinator.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class RepositoriesCoordinator: Coordinator {

    var service: RepositoriesService
    var navigationController: UINavigationController
    
    init(service: RepositoriesService, navigationController: UINavigationController) {
        self.service = service
        self.navigationController = navigationController
    }
    
    func start() {
        let listRepositoriesController = ListRespositoriesController(service: service)
        navigationController.pushViewController(listRepositoriesController, animated: true)
    }
}
