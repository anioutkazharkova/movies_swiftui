//
//  MovieItem.swift
//  network_test
//
//  Created by Anna Zharkova on 11.08.2020.
//

import Foundation

struct MovieItem : Codable,Identifiable {
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
   var releaseDate: Date = Date()
    var posterPath: String = ""
    
    var imagePath: String {
        return  "http://image.tmdb.org/t/p/w300\(self.posterPath)"
    }
    
   /* enum CodingKeys : String, CodingKey {
        case title = "title"
        case id = "id"
        case overview = "overview"
    }*/
}

/*
 {\"popularity\":151.357,\"vote_count\":157,\"video\":false,\"poster_path\":\"\\/b5XfICAvUe8beWExBz97i0Qw4Qh.jpg\",\"id\":612706,\"adult\":false,\"backdrop_path\":\"\\/ishzDCZIv9iWfI70nv5E4ZreYUD.jpg\",\"original_language\":\"en\",\"original_title\":\"Work It\",\"genre_ids\":[35,10402],\"title\":\"Work It\",\"vote_average\":8,\"overview\":\"A brilliant but clumsy high school senior vows to get into her late father\'s alma mater by transforming herself and a misfit squad into dance champions.\",\"release_date\":\"2020-08-07\"}
 **/
