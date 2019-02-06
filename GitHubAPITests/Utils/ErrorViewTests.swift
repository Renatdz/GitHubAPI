//
//  ErrorViewTests.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 06/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable implicitly_unwrapped_optional

import Quick
import Nimble
import Nimble_Snapshots
@testable import GitHubAPI

class ErrorViewTests: QuickSpec {

    override func spec() {

        describe("ErrorViewTests") {

            var sut: ErrorView!

            context("when you tried to instantiate HomeView with coder") {

                beforeEach {
                    let coder = NSCoder()
                    sut = ErrorView(coder: coder)
                }

                it("should be expected a nil value") {
                    expect(sut).to(beNil())
                }
            }

            context("when load into screen") {

                beforeEach {
                    let frame = CGRect(x: 0, y: 0, width: 320, height: 300)
                    sut = ErrorView(delegate: nil, frame: frame)
                    sut.set(message: "Não achamos resultados")
                }

                it("should have the expected layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
