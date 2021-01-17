//
//  MoviesFutureService.swift
//  moviesapp
//
//  Created by Anna Zharkova on 17.01.2021.
//

import Foundation
import Combine

class MoviesFutureService : NSObject {
    private let key = "6c52966d9be717e486a2a0c499867009"
    private let baseUrl = "http://api.themoviedb.org/3/discover/"
    let networkService = NetworkService()
    
    private override init() {
        super.init()
    }
    
    static let shared = MoviesFutureService()
    
    func getMovies()->AnyPublisher<MoviesList,Error> {
        return self.networkService.request(url: "\(baseUrl)movie?api_key=\(key)&page=1&sort_by=popularity.desc", parameters: [:], method: .get)
    }
    
    func search(text: String)->AnyPublisher<MoviesList,Error>  {
        return  self.networkService.request(url: "\(baseUrl)movie?api_key=\(key)&query=\(text)&page=1", parameters: [:], method: .get)
    }
}
