//
//  MoviesFutureService.swift
//  moviesapp
//
//  Created by Anna Zharkova on 17.01.2021.
//

import Foundation
import Combine

class MoviesFutureService : NSObject {
    let networkService = NetworkService()
    
    private override init() {
        super.init()
    }
    
    static let shared = MoviesFutureService()
    
    func getMovies()->AnyPublisher<MoviesList,Error> {
        return self.networkService.request(url: "http://api.themoviedb.org/3/discover/movie?api_key=6c52966d9be717e486a2a0c499867009&page=1&sort_by=popularity.desc", parameters: [:], method: .get).eraseToAnyPublisher()
    }
    
    func search(text: String)->AnyPublisher<MoviesList,Error>  {
        return  self.networkService.request(url: "http://api.themoviedb.org/3/search/movie?api_key=6c52966d9be717e486a2a0c499867009&query=\(text)&page=1", parameters: [:], method: .get).eraseToAnyPublisher()
    }
}
