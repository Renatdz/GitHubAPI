//
//  ListRepositoriesViewProtocolMock.swift
//  GitHubAPITests
//
//  Created by renato.mendes on 07/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

@testable import GitHubAPI

final class ListRepositoriesViewProtocolMock: ListRepositoriesViewProtocol {

    var isShowLoadingCalled = false
    var isHideLoadingCalled = false
    var isShowErrorCalled = false
    var isSetCalled = false
    var isShowEmptyView = false

    func showLoading() {
        isShowLoadingCalled = true
    }

    func hideLoading() {
        isHideLoadingCalled = true
    }

    func showError(message: String) {
        isShowErrorCalled = true
    }

    func set(_ repositories: [Repository]) {
        isSetCalled = true
    }

    func showEmptyView() {
        isShowEmptyView = true
    }
}
