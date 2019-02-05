//
//  CodableView.swift
//  GitHubAPI
//
//  Created by renato.mendes on 10/24/18.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import Foundation

public protocol CodableView: class {
    func buildHierarchy()
    func buildConstraints()
    func setup()
    func buildCodableView()
}

public extension CodableView {

    public func buildCodableView() {
        buildHierarchy()
        buildConstraints()
        setup()
    }

    public func setup() { }
}
