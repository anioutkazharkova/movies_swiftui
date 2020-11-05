//
//  SearchLogic.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation

protocol ISearchLogic : class {
    var output: ISearchOutput? {get set}
    
    func search(text: String)
}

class SearchLogic: ISearchLogic {
    weak var service = MoviesService.shared
    weak var output: ISearchOutput?
    private var items: [MovieItem] = [MovieItem]()
    
    func search(text: String) {
        self.service?.search(text: text){ [weak self] (result: ContentResponse<MoviesList>)  in
            guard let self = self else {return}
            if result.content != nil {
                self.items = [MovieItem]()
                self.items.append(contentsOf: result.content?.results ?? [MovieItem]())
                self.output?.setupMovies(items: self.items)
            }
        }
    }
    
}
