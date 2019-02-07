//
//  APIClientMock.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable force_try

import Foundation
@testable import GitHubAPI

final class APIClientMock: APIClient {

    var isRequestCalled = false
    var result: Result<Data>?
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void) {
        isRequestCalled = true
        guard let result = result else { return }
        completion(result)
    }

    func cancelRequest() {

    }
}

final class APIClientRepositoriesMock: APIClient {
    var isRequestCalled = false
    var endpoints: [Endpoint] = []
    var callsCount = 1
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void) {

        var result: Result<Data>?

        if callsCount == 1 {
            let data = try! JSONEncoder().encode(RepositoryResult.default())
            result = Result.success(data)
        }

        callsCount += 1
        self.endpoints.append(endpoint)
        isRequestCalled = true
        guard let response = result else { return }
        completion(response)
    }
}
