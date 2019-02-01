//
//  ListRepositoriesView.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

final class ListRepositoriesView: UIView {
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildCodableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListRepositoriesView: CodableView {
    
    func buildHierarchy() {
        addSubview(label)
    }
    
    func buildConstraints() {
        label.centerXConstraint(parentView: self)
        label.centerYConstraint(parentView: self)
    }

    func setup() {
        backgroundColor = .white
        label.text = "Hello World!"
    }
}
