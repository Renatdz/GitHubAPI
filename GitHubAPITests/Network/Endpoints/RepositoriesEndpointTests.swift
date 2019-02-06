//
//  RepositoriesEndpointTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional force_unwrapping

import Quick
import Nimble

@testable import GitHubAPI

class RepositoriesEndpointTests: QuickSpec {

    override func spec() {

        describe("ResultsEndpointTests") {

            var sut: RepositoriesEndpoint!

            beforeEach {
                sut = RepositoriesEndpoint(language: "swift", sort: "stars", page: 1)
            }

            context("when instantiated") {
                it("should return right values") {
                    expect(sut.method) == MethodHTTP.get
                    expect(sut.parameterEncoding) == ParameterEncoding.url
                }
            }

            context("When errorMessage is called") {
                context("When status code is mapped") {
                    it("Should return message properly") {
                        expect(sut.errorMessage(with: 404)!.localizedDescription).to(equal("Erro de conexão"))
                    }
                }
            }
        }
    }
}
