//
//  INetworkService.swift
//  newsapp
//
//  Created by Anna Zharkova on 17.07.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation

protocol INetworkService {
    func request<T>(url: String, parameters: [String : Any], method: Methods, completion: @escaping(ContentResponse<T>)->Void) where T: Codable
}
