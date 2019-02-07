//
//  Error+Util.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

public enum GenericError: PrintableError {
    case parse
    case noConnection
    case networking(Int?)
    case unknown

    public var localizedDescription: String {
        switch self {
        case .parse:
            return "Syntax error"

        case .noConnection:
            return "It looks like you don't have connection.\nVerify your internet."

        case .networking:
            return "Connection error"

        case .unknown:
            return "An unexpected error occurred.\nPlease, try again."
        }
    }
}
