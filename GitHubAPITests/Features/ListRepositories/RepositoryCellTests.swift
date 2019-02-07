//
//  RepositoryCellTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 07/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional force_unwrapping

import Quick
import Nimble
import Nimble_Snapshots
@testable import GitHubAPI

final class RepositoryCellTests: QuickSpec {

    override func spec() {

        describe("RepositoryCellTests") {

            var sut: RepositoryCell!

            context("when you tried to instantiate RepositoryCell with coder") {

                beforeEach {
                    let coder = NSCoder()
                    sut = RepositoryCell(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when load into screen") {

                beforeEach {
                    let frame = CGRect(x: 0, y: 0, width: 320, height: 171)
                    let repository = RepositoryResult.default().items.first!

                    sut = RepositoryCell(frame: frame)
                    sut.setup(with: repository)
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
