//
//  ListRepositoriesView.swift
//  GitHubAPI
//
//  Created by renato.mendes on 31/01/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit
import Reusable

final class ListRepositoriesView: UIView {
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(cellType: RepositoryCell.self)
        return tableView
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
        addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.safeAreaTop(safeAreaView: self, statusBar: true)
        tableView.leftConstraint(parentView: self)
        tableView.rightConstraint(parentView: self)
        tableView.bottomConstraint(parentView: self)
    }

    func setup() {
        backgroundColor = .white
    }
}
