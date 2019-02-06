//
//  RepositoryResultMock.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

@testable import GitHubAPI

extension RepositoryResult {

    static func `default`() -> RepositoryResult {
        let owner = Owner(id: 0, name: "default", avatar: "default")
        let repository = Repository(id: 0, name: "default", fullName: "default", owner: owner, stars: 0)
        return RepositoryResult(count: 0, items: [repository])
    }
}
