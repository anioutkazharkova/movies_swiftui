//
//  NetworkConfiguration.swift
//  newsapp
//
//  Created by Anna Zharkova on 17.07.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation

class NetworkConfiguration: NSObject, INetworkConfigurarion {
    private let apiKey = "5b86b7593caa4f009fea285cc74129e2"
    private let url = "http://newsapi.org/v2/"
    
    func getHeaders() -> [String : String] {
        return ["X-Api-Key" : apiKey]
    }
    
    func getBaseUrl()->String {
        return url
    }
}
