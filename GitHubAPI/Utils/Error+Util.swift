//
//  Error+Util.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

public enum GenericError: PrintableError {
    case parse
    case no_connection
    case networking(Int?)
    case unknown
    
    public var localizedDescription: String {
        switch self {
        case .parse:
            return "Erro de sintaxe"
            
        case .no_connection:
            return "Parece que você está sem internet. Verifique sua conexão."
            
        case .networking:
            return "Erro de conexão"
            
        case .unknown:
            return "Ocorreu um erro inesperado, por favor, tente novamente."
        }
    }
    
    public var title: String {
        return "Erro"
    }
    
    public var imageName: String {
        switch self {
        case .no_connection:
            return "error_no_connection"
        default:
            return "error_unknown"
        }
    }
}
