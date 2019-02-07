//
//  ListRepositoriesViewTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional function_body_length

import Quick
import Nimble
import Nimble_Snapshots
@testable import GitHubAPI

class ListRepositoriesViewTests: QuickSpec {

    override func spec() {

        describe("ListRepositoriesViewTests") {

            var sut: ListRepositoriesView!

            context("when you tried to instantiate ListRepositoriesView with coder") {

                beforeEach {
                    let coder = NSCoder()
                    sut = ListRepositoriesView(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when repositories are shown") {

                beforeEach {
                    sut = ListRepositoriesView(tryAgainDelegate: nil)
                    sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)

                    let repositories = RepositoryResult.default().items

                    sut.show(repositories: repositories)
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("when loading is shown") {

                beforeEach {
                    sut = ListRepositoriesView(tryAgainDelegate: nil)
                    sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
                    sut.showLoading()
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("when loading is hidden") {

                beforeEach {
                    sut = ListRepositoriesView(tryAgainDelegate: nil)
                    sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
                    sut.showLoading()
                    sut.hideLoading()
                }

                it("should have the expected layout") {
                    expect(sut.tableView.refreshControl?.isRefreshing) == false
                    expect(sut.loading.isHidden) == true
                }
            }

            context("when emptyView is shown") {

                beforeEach {
                    sut = ListRepositoriesView(tryAgainDelegate: nil)
                    sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
                    sut.showEmptyView()
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("when errorView is shown") {

                beforeEach {
                    sut = ListRepositoriesView(tryAgainDelegate: nil)
                    sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
                    sut.showErrorView(message: "Ocorreu um erro inesperado.\nPor favor, tente novamente.")
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }

            context("when errorView is shown to pull refresh or infinite scroll action") {

                beforeEach {
                    sut = ListRepositoriesView(tryAgainDelegate: nil)
                    sut.frame = CGRect(x: 0, y: 0, width: 320, height: 568)

                    let repositories = RepositoryResult.default().items

                    sut.show(repositories: repositories)
                    sut.pullToRefresh()
                    sut.showErrorView(message: "Ocorreu um erro inesperado.\nPor favor, tente novamente.")
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
