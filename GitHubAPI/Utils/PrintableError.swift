//
//  PrintableError.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

public protocol PrintableError: Error {
    var localizedDescription: String { get }
}
