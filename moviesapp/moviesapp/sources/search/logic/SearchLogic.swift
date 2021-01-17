//
//  SearchLogic.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation
import Combine

protocol ISearchLogic : class {
    var output: ISearchOutput? {get set}
    
    func search(text: String)
}

class SearchLogic: ISearchLogic {
    weak var service = MoviesFutureService.shared
    weak var output: ISearchOutput?
    private var items: [MovieItem] = [MovieItem]()
    var subscriptions = Set<AnyCancellable>()
    
    func search(text: String) {
    let _ =  self.service?.search(text: text).sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
            print(error.localizedDescription)
        case .finished:
            print("Success")
        }
    }, receiveValue: { (list) in
        self.items = [MovieItem]()
        self.items.append(contentsOf: list.results)
        self.output?.setupMovies(items: self.items)
    }).store(in: &subscriptions)
    }
    
}
