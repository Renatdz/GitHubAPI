//
//  ListRepositoriesDataSource.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit
import Reusable

final class ListRepositoriesDataSource: NSObject {
    
    private(set) var repositories: [Repository] = []
    
    func set(_ repositories: [Repository]) {
        self.repositories.append(contentsOf: repositories)
    }
    
    func clear() {
        self.repositories.removeAll()
    }
}

extension ListRepositoriesDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(with: repositories[indexPath.row])
        
        return cell
    }
}
