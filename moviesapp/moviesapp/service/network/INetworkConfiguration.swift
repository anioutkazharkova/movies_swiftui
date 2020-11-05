//
//  INetworkConfiguration.swift
//  newsapp
//
//  Created by Anna Zharkova on 17.07.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation

protocol INetworkConfigurarion : class {
    func getHeaders() -> [String : String]
    
    func getBaseUrl()->String
}
