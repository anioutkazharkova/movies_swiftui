//
//  MoviesListLogic.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation
import Combine

protocol IMoviesLogic : class {
    var output: IMoviesOutput? {get set}
}

class MoviesListLogic {
    weak var service = MoviesFutureService.shared
    weak var output: IMoviesOutput?
    private var items: [MovieItem] = [MovieItem]()
    var subscriptions = Set<AnyCancellable>()
    
    func loadData() {
        _ = self.service?.getMovies().sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                self.output?.showError(error: error)
                print(error.localizedDescription)
            case .finished:
                print("Success")
            }
        }, receiveValue: { (list) in
            let items = list.results
            self.items = [MovieItem]()
            self.items.append(contentsOf: items)
            self.output?.setupMovies(items: items)
        }).store(in: &subscriptions)
    }
    
}
