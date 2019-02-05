//
//  owner.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable identifier_name

struct Owner: Codable {

    private(set) var id: Int
    private(set) var name: String
    private(set) var avatar: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatar = "avatar_url"
    }

    init(id: Int, name: String, avatar: String) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
}
