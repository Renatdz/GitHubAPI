//
//  RequestAPIClient.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

// swiftlint:disable function_parameter_count multiline_parameters

import Foundation
import Alamofire

final class RequestAPIClient: APIClient {

    private let sessionManager: SessionManager
    private let baseURL: URL
    private var endpoint: Endpoint?

    init(baseURL: URL, sessionManager: SessionManager) {
        self.baseURL = baseURL
        self.sessionManager = sessionManager
    }

    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data>) -> Void) {
        guard let fullPath = URL(string: baseURL.absoluteString + endpoint.path) else {
            return completion(.failure(GenericError.unknown))
        }

        let method: HTTPMethod = Alamofire.HTTPMethod(rawValue: endpoint.method.rawValue) ?? .get
        let parameters = endpoint.parameters
        let headers = endpoint.headers

        var encoding: Alamofire.ParameterEncoding
        switch endpoint.parameterEncoding {
        case .json:
            encoding = JSONEncoding()
        case .url:
            encoding = URLEncoding()
        }

        self.endpoint = endpoint

        request(fullPath, method: method, parameters: parameters, encoding: encoding, headers: headers, completion: completion)
    }

    private func request(_ fullPath: URLConvertible,
                         method: HTTPMethod,
                         parameters: Parameters?,
                         encoding: Alamofire.ParameterEncoding,
                         headers: HTTPHeaders?, completion: @escaping (Result<Data>) -> Void) {
        sessionManager.request(fullPath,
                               method: method,
                               parameters: parameters,
                               encoding: encoding, headers: headers).validate(statusCode: 200 ..< 300).responseData { response in

                                switch response.result {
                                case .success:
                                    if let data = response.data {
                                        completion(.success(data))
                                        break
                                    }

                                    fallthrough

                                case .failure:
                                    completion(.failure(GenericError.networking(response.response?.statusCode)))
                                }
        }
    }

}
