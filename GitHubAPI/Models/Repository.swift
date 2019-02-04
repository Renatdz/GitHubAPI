//
//  Repository.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

struct Repository: Codable {
    
    private(set) var id: Int
    private(set) var name: String
    private(set) var fullName: String
    private(set) var owner: Owner
    private(set) var stars: Int
    private(set) var watchers: Int
    private(set) var forks: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case stars = "stargazers_count"
        case watchers = "watchers_count"
        case forks
    }
    
    init(id: Int, name: String, fullName: String, owner: Owner, stars: Int, watchers: Int, forks: Int) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.stars = stars
        self.watchers = watchers
        self.forks = forks
    }
}
