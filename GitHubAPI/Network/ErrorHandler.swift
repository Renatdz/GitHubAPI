//
//  ErrorHandler.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

protocol ErrorHandler {
    func handle<T>(endpoint: Endpoint?, status: Int?) -> Result<T>
}

public final class DefaultErrorHandler: ErrorHandler {
    
    func handle<T>(endpoint: Endpoint?, status: Int?) -> Result<T> {
        guard let status = status else {
            return Result.failure(GenericError.unknown)
        }
        
        guard let error = endpoint?.errorMessage(with: status) else {
            return Result.failure(GenericError.networking(status))
        }
        
        return Result.failure(error)
    }
}
