//
//  AppCoordinator.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class AppCoordinator {
    
    private let navigationController: UINavigationController = UINavigationController()
    
    func start() -> UIViewController {
        let repositoriesCoordinator: RepositoriesCoordinator = RepositoriesCoordinator(navigationController: navigationController)
        repositoriesCoordinator.start()
        
        return navigationController
    }
}
