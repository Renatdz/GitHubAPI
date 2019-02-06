//
//  ConnectableMock.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

@testable import GitHubAPI

class ConnectableMock: Connectable {

    var isConnectedToInternetResponse = false

    var isConnectedToInternet: Bool {
        return isConnectedToInternetResponse
    }
}
