//
//  MoviesListViewModel.swift
//  moviesapp
//
//  Created by Anna Zharkova on 17.01.2021.
//

import Foundation
import Combine

class MoviesListViewModel: ObservableObject {
    weak var service = MoviesFutureService.shared
    @Published  var data:[MovieItem] = [MovieItem]()
    var subscriptions = Set<AnyCancellable>()
    
    func loadMovies() {
        _ = self.service?.getMovies().sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("Success")
            }
        }, receiveValue: { (list) in
            let items = list.results
            self.data = [MovieItem]()
            self.data.append(contentsOf: items)
        }).store(in: &subscriptions)
    }
}
