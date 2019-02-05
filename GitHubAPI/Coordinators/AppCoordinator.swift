//
//  AppCoordinator.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable force_unwrapping

import UIKit

public protocol Coordinator: class {
    var navigationController: UINavigationController { get set }

    func start()
}

final class AppCoordinator {

    private let navigationController: UINavigationController = UINavigationController()
    private let baseURL: URL = URL(string: "https://api.github.com")!

    private lazy var apiClient: APIClient = APIClientBuilder(baseURL: self.baseURL)
        .withErrorHandler()
        .connectivity()
        .build()

    private lazy var serviceFactory: ServiceFactory = APIServiceFactory(apiClient: apiClient)

    init(serviceFactory: ServiceFactory? = nil) {
        if let serviceFactory = serviceFactory {
            self.serviceFactory = serviceFactory
        }
    }

    func start() -> UIViewController {
        let repositoriesCoordinator: RepositoriesCoordinator = RepositoriesCoordinator(service: serviceFactory.getRepositoriesService(),
                                                                                       navigationController: navigationController)
        repositoriesCoordinator.start()

        return navigationController
    }
}
