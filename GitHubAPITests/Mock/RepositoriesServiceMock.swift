//
//  RepositoriesServiceMock.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 07/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import Foundation
@testable import GitHubAPI

class RepositoriesServiceMock: RepositoriesService {

    var result: Result<[Repository]>

    var isResultCompletionSuccessCalled = false
    var isResultCompletionFailureCalled = false

    init(result: Result<[Repository]>) {
        self.result = result
    }

    func fetchRepositories(language: String, sort: String, page: Int, completion: @escaping (Result<[Repository]>) -> Void) {
        switch result {
        case .success:
            isResultCompletionSuccessCalled = true
            completion(result)

        case .failure:
            isResultCompletionFailureCalled = true
            completion(.failure(GenericError.unknown))
        }

    }
}
