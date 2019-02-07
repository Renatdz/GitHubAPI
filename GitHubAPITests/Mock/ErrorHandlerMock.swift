//
//  ErrorHandlerMock.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import Foundation
@testable import GitHubAPI

final class ErrorHandlerMock: ErrorHandler {

    var isHandleCalled = false
    var statusCode: Int?

    func handle<T>(endpoint: Endpoint?, status: Int?) -> Result<T> {
        isHandleCalled = true
        statusCode = status
        return Result.failure(GenericError.unknown)
    }
}
