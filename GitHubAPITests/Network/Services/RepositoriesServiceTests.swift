//
//  RepositoriesServiceTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional

import Quick
import Nimble

@testable import GitHubAPI

class RepositoriesServiceTests: QuickSpec {

    override func spec() {

        describe("RepositoriesServiceTests") {

            var sut: DefaultRepositoriesService!
            let apiClientMock = APIClientRepositoriesMock()

            beforeEach {
                sut = DefaultRepositoriesService(apiClient: apiClientMock)
            }

            context("When repositories is called") {

                context("When it success") {

                    beforeEach {
                        sut.fetchRepositories(language: "", sort: "", page: 0) { _ in }
                    }

                    it("Should show correct endpoints") {
                        expect(apiClientMock.endpoints.removeFirst()).to(beAKindOf(RepositoriesEndpoint.self))
                    }
                }
            }
        }
    }
}
