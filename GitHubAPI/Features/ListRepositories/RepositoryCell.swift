//
//  RepositoryCell.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit
import Reusable

final class RepositoryCell: UITableViewCell {

    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "hello world!"
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepositoryCell {

    func setup(with repository: Repository) {
        buildCodableView()
    }
}

extension RepositoryCell: Reusable { }

extension RepositoryCell: CodableView {

    func buildHierarchy() {
        contentView.addSubview(label)
    }

    func buildConstraints() {
        label.centerXConstraint(parentView: contentView)
        label.centerYConstraint(parentView: contentView)
    }

    func setup() {

    }
}
