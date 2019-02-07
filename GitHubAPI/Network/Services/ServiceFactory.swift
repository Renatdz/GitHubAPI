//
//  ServiceFactory.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

protocol ServiceFactory {
    func getRepositoriesService() -> RepositoriesService
}

public final class APIServiceFactory: ServiceFactory {

    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func getRepositoriesService() -> RepositoriesService {
        return DefaultRepositoriesService(apiClient: apiClient)
    }
}
