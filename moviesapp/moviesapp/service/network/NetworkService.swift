//
//  NetworkService.swift
//  newsapp
//
//  Created by Anna Zharkova on 17.07.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation
import Combine

enum Methods {
    case get, post, patch, delete
    
    func toMethod()->String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}

class NetworkService: NSObject, INetworkService {
    let config: INetworkConfigurarion = NetworkConfiguration()
    
    var urlConfiguration = URLSessionConfiguration.default
    
    lazy var urlSession: URLSession? = {
        return URLSession(configuration: urlConfiguration)
    }()
    
    var dataTask: URLSessionDataTask? = nil
    
    func request<T>(url: String, parameters: [String : Any], method: Methods)->Future<T,Error> where T: Codable{
        return Future { promise  in
            let apiUrl = url//"\(self.config.getBaseUrl())\(url)"
            
            guard let urlPath = URL(string: apiUrl) else {
                return
            }
            var urlRequest = URLRequest(url: urlPath)
            urlRequest.httpMethod = method.toMethod()
            
            
            self.dataTask = self.urlSession?.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                if let _ = error {
                    let errorResult =  ErrorResponse(type: .network)
                    DispatchQueue.main.async {
                        return promise(.failure(errorResult))
                    }
                } else {
                    if let data = data, let response = response as? HTTPURLResponse {
                        let result = ContentResponse<T>(response: response, data: data)
                        DispatchQueue.main.async {
                            if let content = result.content {
                                return promise(.success(content))
                            } else
                            if let er = result.error {
                                return promise(.failure(er))
                            }
                        }
                    }else {
                        let errorResult =  ErrorResponse(type: .network)
                        DispatchQueue.main.async {
                            return promise(.failure(errorResult))
                        }
                    }
                }
            })
            
            self.dataTask?.resume()
        }
    }
}
