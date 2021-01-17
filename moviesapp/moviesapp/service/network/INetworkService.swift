//
//  INetworkService.swift
//  newsapp
//
//  Created by Anna Zharkova on 17.07.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation
import Combine

protocol INetworkService {
    func request<T:Codable>(url: String, parameters: [String : Any], method: Methods)->AnyPublisher<T,Error>
}
