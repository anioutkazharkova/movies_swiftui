//
//  MoviesList.swift
//  network_test
//
//  Created by Anna Zharkova on 11.08.2020.
//

import Foundation

struct MoviesList: Codable {
    var results: [MovieItem] = [MovieItem]()
    
    enum CodingKeys : String, CodingKey {
        case results = "results"
    }
}
