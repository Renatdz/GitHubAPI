//
//  APIClientBuilder.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import Foundation
import Alamofire

public enum Result<T>: Equatable {
    case success(T)
    case failure(PrintableError)
    
    public static func == (lhs: Result, rhs: Result) -> Bool {
        switch (lhs, rhs) {
        case (.failure, .failure), (.success, .success):
            return true
        default:
            return false
        }
    }
}

protocol APIClient {
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void)
}

public final class APIClientBuilder {
    private var apiClient: APIClient
    
    init(baseURL: URL, sessionManager: SessionManager = SessionManager()) {
        apiClient = RequestAPIClient(baseURL: baseURL, sessionManager: sessionManager)
    }
    
    func withErrorHandler(errorHandler: ErrorHandler = DefaultErrorHandler()) -> APIClientBuilder {
        apiClient = ErrorHandlerAPIClient(apiClient: apiClient, errorHandler: errorHandler)
        return self
    }
    
    func connectivity(connectivity: Connectable = Connectivity()) -> APIClientBuilder {
        apiClient = ConnectableAPIClient(apiClient: apiClient, connectivity: connectivity)
        return self
    }
    
    func build() -> APIClient {
        return apiClient
    }
}
