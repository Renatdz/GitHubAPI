//
//  ServiceFactoryTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable force_unwrapping implicitly_unwrapped_optional

import Quick
import Nimble

@testable import GitHubAPI

final class ServiceFactoryTests: QuickSpec {

    override func spec() {

        describe("ServiceFactoryTests") {

            var sut: ServiceFactory!

            beforeEach {
                let apiClient = APIClientBuilder(baseURL: URL(string: "https://api.github.com")!)
                    .withErrorHandler()
                    .connectivity()
                    .build()
                sut = APIServiceFactory(apiClient: apiClient)
            }

            context("When getRepositoriesService is called") {
                it("Should return a RepositoriesService") {
                    expect(sut.getRepositoriesService()).to(beAKindOf(RepositoriesService.self))
                }
            }
        }
    }
}
