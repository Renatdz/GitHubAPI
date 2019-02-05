//
//  ConnectableAPIClient.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import Foundation

final class ConnectableAPIClient: APIClient {

    private let apiClient: APIClient
    private let connectivity: Connectable

    init(apiClient: APIClient, connectivity: Connectable = Connectivity()) {
        self.apiClient = apiClient
        self.connectivity = connectivity
    }

    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void) {
        if !connectivity.isConnectedToInternet {
            completion(.failure(GenericError.noConnection))
        } else {
            apiClient.request(endpoint, completion: completion)
        }
    }
}
