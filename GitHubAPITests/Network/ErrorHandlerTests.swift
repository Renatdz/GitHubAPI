//
//  ErrorHandlerTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional

import Quick
import Nimble

@testable import GitHubAPI

final class ErrorHandlerTests: QuickSpec {

    override func spec() {

        describe("ErrorHandler") {

            var sut: DefaultErrorHandler!
            var result: Result<RepositoryResult>!

            beforeEach {
                sut = DefaultErrorHandler()
            }

            context("When handle is called") {

                context("When status is nil") {

                    beforeEach {
                        result = sut.handle(endpoint: nil, status: nil)
                    }

                    it("Should return result failure with unknow error type") {
                        expect(result == Result<RepositoryResult>.failure(GenericError.unknown)).to(beTrue())
                    }
                }

                context("When endpoint is nil") {

                    beforeEach {
                        result = sut.handle(endpoint: nil, status: 404)
                    }

                    it("Should return result failure with GenericError error type") {
                        expect(result == Result<RepositoryResult>.failure(GenericError.networking(404))).to(beTrue())
                    }
                }

                context("When endpoint has an errorMessage") {

                    beforeEach {
                        let repositoriesEndpoint = RepositoriesEndpoint(language: "swift", sort: "stars", page: 1)

                        result = sut.handle(endpoint: repositoriesEndpoint, status: 404)
                    }

                    it("Should return result failure with error from endpoint") {
                        expect(result == Result<RepositoryResult>.failure(GenericError.networking(404))).to(beTrue())
                    }
                }
            }

        }
    }
}
