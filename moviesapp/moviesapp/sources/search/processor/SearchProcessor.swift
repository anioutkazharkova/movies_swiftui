//
//  SearchProcessor.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation

protocol ISearchOutput : class{
    func setupMovies(items: [MovieItem])
}

class SearchProcessor: NSObject, ISearchOutput, IProcessor {
    var logic: ISearchLogic? = nil
    var view: ISearchView? = nil
    
    func perform(type: IntentType) {
        switch type {
        case .search(let text):
            self.logic?.search(text: text)
        default:
            break
        }
    }
    
    func setupMovies(items: [MovieItem]) {
        self.view?.update(data: items)
    }
}
