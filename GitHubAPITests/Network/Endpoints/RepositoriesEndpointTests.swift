//
//  RepositoriesEndpointTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional

import Quick
import Nimble

@testable import GitHubAPI

final class RepositoriesEndpointTests: QuickSpec {

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
        }
    }
}
