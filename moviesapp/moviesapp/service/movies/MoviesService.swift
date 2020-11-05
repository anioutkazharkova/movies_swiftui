//
//  NewsService.swift
//  newsapp
//
//  Created by Anna Zharkova on 17.07.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation

class MoviesService : NSObject {
    let networkService = NetworkService()
    
    private override init() {
        super.init()
    }
    
    static let shared = MoviesService()
    
    func getMovies(completion: @escaping(ContentResponse<MoviesList>)->Void) {
        self.networkService.request(url: "http://api.themoviedb.org/3/discover/movie?api_key=6c52966d9be717e486a2a0c499867009&page=1&sort_by=popularity.desc", parameters: [:], method: .get) { (result: ContentResponse<MoviesList>) in
            completion(result)
        }
    }
    
    func search(text: String, completion: @escaping(ContentResponse<MoviesList>)->Void) {
        self.networkService.request(url: "http://api.themoviedb.org/3/search/movie?api_key=6c52966d9be717e486a2a0c499867009&query=\(text)&page=1", parameters: [:], method: .get) { (result: ContentResponse<MoviesList>) in
            completion(result)
        }
    }
}
