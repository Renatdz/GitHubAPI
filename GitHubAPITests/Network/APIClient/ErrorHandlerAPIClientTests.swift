//
//  ErrorHandlerAPIClientTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional trailing_closure

import Quick
import Nimble
@testable import GitHubAPI

class ErrorHandlerAPIClientTests: QuickSpec {

    override func spec() {

        describe("ErrorHandlerAPIClientTests") {

            var sut: ErrorHandlerAPIClient!
            var apiClient: APIClientMock!
            var errorHandler: ErrorHandlerMock!
            var repositoriesEndpoint: RepositoriesEndpoint!

            beforeEach {
                apiClient = APIClientMock()
                errorHandler = ErrorHandlerMock()
                sut = ErrorHandlerAPIClient(apiClient: apiClient, errorHandler: errorHandler)

                repositoriesEndpoint = RepositoriesEndpoint(language: "swift", sort: "stars", page: 1)
            }

            context("When request is called") {

                context("When success") {
                    var isCompletionCalled = false

                    beforeEach {
                        guard let data = try? JSONEncoder().encode(RepositoryResult.default()) else { return }
                        apiClient.result = Result.success(data)

                        sut.request(repositoriesEndpoint, completion: { _ in
                            isCompletionCalled = true
                        })
                    }

                    afterEach {
                        isCompletionCalled = false
                    }

                    it("Should call request from apiClient") {
                        expect(apiClient.isRequestCalled).to(beTrue())
                    }

                    it("Should call completion") {
                        expect(isCompletionCalled).to(beTrue())
                    }
                }

                context("When failure") {

                    context("When error is FLError of networking type") {
                        var isCompletionCalled = false

                        beforeEach {
                            apiClient.result = Result.failure(GenericError.networking(404))

                            sut.request(repositoriesEndpoint, completion: { _ in
                                isCompletionCalled = true
                            })
                        }

                        it("Should call request from apiClient") {
                            expect(apiClient.isRequestCalled).to(beTrue())
                        }

                        it("Should call completion") {
                            expect(isCompletionCalled).to(beTrue())
                        }

                        it("Should call handle from errorHandler with properly statusCode") {
                            expect(errorHandler.isHandleCalled).to(beTrue())
                        }
                    }

                    context("When error is not of networking type") {
                        var isCompletionCalled = false

                        beforeEach {
                            apiClient.result = Result.failure(GenericError.unknown)

                            sut.request(repositoriesEndpoint, completion: { _ in
                                isCompletionCalled = true
                            })
                        }

                        it("Should call request from apiClient") {
                            expect(apiClient.isRequestCalled).to(beTrue())
                        }

                        it("Should call completion") {
                            expect(isCompletionCalled).to(beTrue())
                        }

                        it("Should call handle from errorHandler with statusCode nil") {
                            expect(errorHandler.isHandleCalled).to(beTrue())
                            expect(errorHandler.statusCode).to(beNil())
                        }
                    }
                }
            }
        }
    }
}
