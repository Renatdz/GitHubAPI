//
//  RepositoryResult.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

struct RepositoryResult: Codable {

    private(set) var count: Int
    private(set) var items: [Repository]

    enum CodingKeys: String, CodingKey {
        case count = "total_count"
        case items
    }

    init(count: Int, items: [Repository]) {
        self.count = count
        self.items = items
    }
}
