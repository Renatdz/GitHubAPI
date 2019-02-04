//
//  RepositoriesService.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import Foundation

protocol RepositoriesService {
    func fetchRepositories(language: String, sort: String, completion: @escaping (Result<[Repository]>) -> Void)
}

public class DefaultRepositoriesService: RepositoriesService {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchRepositories(language: String, sort: String, completion: @escaping (Result<[Repository]>) -> Void) {
        let endpoint = RepositoriesEndpoint(language: language, sort: sort)
        
        apiClient.request(endpoint) { result in
            switch result {
            case let .success(data):
                if let repositoryResult = try? JSONDecoder().decode(RepositoryResult.self, from: data) {
                    completion(.success(repositoryResult.items))
                } else {
                    completion(.failure(GenericError.parse))
                }
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
