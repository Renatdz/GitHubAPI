//
//  RepositoryCell.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

final class RepositoryCell: UITableViewCell {

    private lazy var authorContentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var avatar: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var author: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var repoName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    lazy var stars: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        author.text = repository.owner.name.capitalized

        repoName.text = repository.name.capitalized

        stars.text = "Stars: \(repository.stars)"

        buildCodableView()

        guard let url = URL(string: repository.owner.avatar) else { return }
        avatar.kf.setImage(with: url)
    }
}

extension RepositoryCell: Reusable { }

extension RepositoryCell: CodableView {

    func buildHierarchy() {
        contentView.addSubview(authorContentView)
        authorContentView.addSubview(avatar)
        authorContentView.addSubview(author)
        contentView.addSubview(repoName)
        contentView.addSubview(stars)
    }

    func buildConstraints() {
        authorContentView.topConstraint(parentView: contentView)
        authorContentView.leftConstraint(parentView: contentView, constant: 20)
        authorContentView.bottomConstraint(parentView: contentView)
        authorContentView.widthConstraint(constant: 100)

        avatar.topConstraint(parentView: authorContentView, constant: 10)
        avatar.centerXConstraint(parentView: authorContentView)
        avatar.widthConstraint(constant: 40)
        avatar.heightConstraint(constant: 40)

        author.overConstraint(topItem: avatar, constant: 5)
        author.centerXConstraint(parentView: authorContentView)
        author.bottomConstraint(parentView: authorContentView, constant: 10)

        repoName.topConstraint(parentView: contentView, constant: 10)
        repoName.aside(leftItem: authorContentView, constant: 30)
        repoName.rightConstraint(parentView: contentView, constant: 20)

        stars.overConstraint(topItem: repoName, constant: 5)
        stars.aside(leftItem: authorContentView, constant: 30)
        stars.rightConstraint(parentView: contentView, constant: 20)
        stars.bottomConstraint(parentView: contentView, constant: 10)
    }

    func setup() {

    }
}
