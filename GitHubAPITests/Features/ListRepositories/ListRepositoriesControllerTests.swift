//
//  ListRepositoriesControllerTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 07/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional function_body_length

import Quick
import Nimble
@testable import GitHubAPI

final class ListRepositoriesControllerTests: QuickSpec {

    override func spec() {

        describe("ListRepositoriesControllerTests") {

            var sut: ListRepositoriesController!
            var repositoriesServiceMock: RepositoriesServiceMock!
            var listRepositoriesViewProtocolMock: ListRepositoriesViewProtocolMock!

            beforeSuite {
                listRepositoriesViewProtocolMock = ListRepositoriesViewProtocolMock()
            }

            context("when you tried to instantiate ListRepositoriesController with coder") {

                beforeEach {
                    let coder = NSCoder()
                    sut = ListRepositoriesController(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when viewDidLoad is called") {

                beforeEach {
                    let repositories = RepositoryResult.default().items
                    repositoriesServiceMock = RepositoriesServiceMock(result: .success(repositories))
                    sut = ListRepositoriesController(service: repositoriesServiceMock)
                    _ = sut.view
                }

                it("should have the right title") {
                    expect(sut.title) == "Repositórios"
                }
            }

            context("when fetchRepositories is called") {

                context("with a success result") {
                    beforeEach {
                        let repositories = RepositoryResult.default().items
                        repositoriesServiceMock = RepositoriesServiceMock(result: .success(repositories))

                        sut = ListRepositoriesController(service: repositoriesServiceMock)
                        _ = sut.view
                        sut.listRepositoriesPresenter.setView(listRepositoriesViewProtocolMock)
                        sut.pullToRefresh()
                    }

                    it("should have called the right delegates") {
                        expect(listRepositoriesViewProtocolMock.isShowLoadingCalled) == true
                        expect(listRepositoriesViewProtocolMock.isHideLoadingCalled) == true
                        expect(listRepositoriesViewProtocolMock.isSetCalled) == true
                    }
                }

                context("with a success with empty result") {
                    beforeEach {
                        let repositories = [Repository]()
                        repositoriesServiceMock = RepositoriesServiceMock(result: .success(repositories))

                        sut = ListRepositoriesController(service: repositoriesServiceMock)
                        _ = sut.view
                        sut.listRepositoriesPresenter.setView(listRepositoriesViewProtocolMock)
                        sut.tryAgain()
                    }

                    it("should have called the right delegates") {
                        expect(listRepositoriesViewProtocolMock.isShowLoadingCalled) == true
                        expect(listRepositoriesViewProtocolMock.isHideLoadingCalled) == true
                        expect(listRepositoriesViewProtocolMock.isShowEmptyView) == true
                    }
                }

                context("with a failure result") {
                    beforeEach {
                        repositoriesServiceMock = RepositoriesServiceMock(result: .failure((GenericError.unknown)))

                        sut = ListRepositoriesController(service: repositoriesServiceMock)
                        _ = sut.view
                        sut.listRepositoriesPresenter.setView(listRepositoriesViewProtocolMock)
                        sut.fetchNewRepositories()
                    }

                    it("should have called the right delegates") {
                        expect(listRepositoriesViewProtocolMock.isShowLoadingCalled) == true
                        expect(listRepositoriesViewProtocolMock.isHideLoadingCalled) == true
                        expect(listRepositoriesViewProtocolMock.isShowErrorCalled) == true
                    }
                }
            }
        }
    }
}
