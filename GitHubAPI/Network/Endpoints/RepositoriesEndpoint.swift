//
//  RepositoriesEndpoint.swift
//  GitHubAPI
//
//  Created by renato.mendes on 04/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

class RepositoriesEndpoint: Endpoint {
    
    var method: MethodHTTP = {
       .get
    }()
    
    var path: String
    
    var parameters: [String : Any]?
    
    var headers: [String : String]?
    
    var parameterEncoding: ParameterEncoding = {
       .url
    }()
    
    init(language: String, sort: String, page: Int) {
        path = "/search/repositories?q=language:\(language)&sort=\(sort)&page=\(page)"
        path = path.removingPercentEncoding ?? ""
    }
    
    func errorMessage(with statusCode: Int) -> PrintableError? {
        return GenericError.networking(statusCode)
    }
}
