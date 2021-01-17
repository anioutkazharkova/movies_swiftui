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
    
    func request<T:Codable>(url: String, parameters: [String : Any], method: Methods)->AnyPublisher<T,Error> {
        
        let apiUrl = url//"\(self.config.getBaseUrl())\(url)"
        
        guard let urlPath = URL(string: apiUrl) else {
            return Result<T, Error>.Publisher(ErrorResponse(type: .network)).eraseToAnyPublisher()
        }
        var urlRequest = URLRequest(url: urlPath)
        urlRequest.httpMethod = method.toMethod()
        
        let task =  URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data,response) -> T in
                if let response = response as? HTTPURLResponse {
                    let result = ContentResponse<T>(response: response, data: data)
                    if let content = result.content {
                        return content
                    } else
                    if let er = result.error {
                        throw er
                    }
                }
                throw ErrorResponse(type: .network)
            })
            .mapError({ (error) -> Error in
                return error
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        return task
        
        /* self.urlSession?.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
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
         }*/
    }
}
