//
//  ListRepositoriesDataSourceTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 07/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional

import Quick
import Nimble
@testable import GitHubAPI

class ListRepositoriesDataSourceTests: QuickSpec {

    override func spec() {

        describe("ListRepositoriesDataSourceTests") {

            var sut: ListRepositoriesDataSource!
            var tableView: UITableView!

            beforeSuite {
                sut = ListRepositoriesDataSource()
                tableView = UITableView()
            }

            context("when setRepositories is called") {
                var repositories: [Repository] = []

                beforeEach {
                    repositories = RepositoryResult.default().items
                    sut.set(repositories)
                }

                afterEach {
                    sut.clear()
                }

                it("should have the right number of repositories") {
                    expect(sut.repositories.count) == repositories.count
                }
            }

            context("when clear is called") {
                var repositories: [Repository]!

                beforeEach {
                    repositories = RepositoryResult.default().items
                    sut.set(repositories)
                    sut.clear()
                }

                it("repositories array should be empty") {
                    expect(sut.repositories.isEmpty) == true
                }
            }

            context("when numberOfRows is called") {
                var repositories: [Repository]!

                beforeEach {
                    repositories = RepositoryResult.default().items
                    sut.set(repositories)
                }

                afterEach {
                    sut.clear()
                }

                it("repositories array should be empty") {
                    let rows = sut.tableView(tableView, numberOfRowsInSection: 0)
                    expect(rows) == repositories.count
                }
            }

            context("when cellForRow is called") {

                beforeEach {
                    let repositories = RepositoryResult.default().items
                    sut.set(repositories)
                }

                afterEach {
                    sut.clear()
                }

                it("cell should be an instance of RepositoryCell") {
                    tableView.register(cellType: RepositoryCell.self)

                    let indexPath = IndexPath(row: 0, section: 0)
                    let cell = sut.tableView(tableView, cellForRowAt: indexPath)

                    expect(cell).to(beAKindOf(RepositoryCell.self))
                }
            }
        }
    }
}
