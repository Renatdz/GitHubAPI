//
//  ConnectableAPIClientTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional trailing_closure

import Quick
import Nimble

@testable import GitHubAPI

class ConnectableAPIClientTests: QuickSpec {

    override func spec() {

        describe("ConnectableAPIClientTests") {

            var sut: ConnectableAPIClient!
            var apiClient: APIClientMock!
            var connectivity: ConnectableMock!
            var repositoriesEndpoint: RepositoriesEndpoint!

            beforeEach {
                apiClient = APIClientMock()
                connectivity = ConnectableMock()
                sut = ConnectableAPIClient(apiClient: apiClient, connectivity: connectivity)

                repositoriesEndpoint = RepositoriesEndpoint(language: "swift", sort: "stars", page: 1)
            }

            context("When request is called") {

                context("When has internet connection") {
                    var isCompletionCalled = false

                    beforeEach {
                        connectivity.isConnectedToInternetResponse = true
                        guard let data = try? JSONEncoder().encode(RepositoryResult.default()) else { return }
                        apiClient.result = Result.success(data)

                        sut.request(repositoriesEndpoint, completion: { _ in
                            isCompletionCalled = true
                        })
                    }

                    it("Should call request from apiClient") {
                        expect(isCompletionCalled).to(beTrue())
                        expect(apiClient.isRequestCalled).to(beTrue())
                    }
                }

                context("When has no internet connection") {
                    var isCompletionCalled = false

                    beforeEach {
                        connectivity.isConnectedToInternetResponse = false
                        guard let data = try? JSONEncoder().encode(RepositoryResult.default()) else { return }
                        apiClient.result = Result.success(data)

                        sut.request(repositoriesEndpoint, completion: { _ in
                            isCompletionCalled = true
                        })
                    }

                    it("Should call completion") {
                        expect(isCompletionCalled).to(beTrue())
                    }
                }
            }
        }
    }
}
