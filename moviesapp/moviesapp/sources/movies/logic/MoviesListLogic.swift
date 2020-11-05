//
//  MoviesListLogic.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation

protocol IMoviesLogic : class {
    var output: IMoviesOutput? {get set}
}

class MoviesListLogic {
    weak var service = MoviesService.shared
    weak var output: IMoviesOutput?
    private var items: [MovieItem] = [MovieItem]()
    
    func loadData() {
        self.service?.getMovies{ [weak self] (result: ContentResponse<MoviesList>)  in
            guard let self = self else {return}
            if result.content != nil {
                self.items = [MovieItem]()
                self.items.append(contentsOf: result.content?.results ?? [MovieItem]())
                self.output?.setupMovies(items: self.items)
            }
        }
    }
    
}
