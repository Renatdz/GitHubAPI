//
//  Connectivity.swift
//  GitHubAPI
//
//  Created by renato.mendes on 01/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import Alamofire

protocol Connectable {
    var isConnectedToInternet: Bool { get }
}

public final class Connectivity: Connectable {
    private var reachability: NetworkReachabilityManager?
    
    init(reachability: NetworkReachabilityManager? = NetworkReachabilityManager()) {
        self.reachability = reachability
    }
    
    var isConnectedToInternet: Bool {
        guard let reachability = self.reachability else {
            return false
        }
        
        return reachability.isReachable
    }
}
