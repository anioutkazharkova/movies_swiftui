//
//  MoviesListProcessor.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation

protocol IMoviesOutput : class{
    func setupMovies(items: [MovieItem])
    
    func showError(error: Error)
}

class MoviesListProcessor: NSObject, IMoviesOutput, IProcessor {
    var logic: MoviesListLogic? = nil 
    var view: IMoviesListView? = nil
    
    func perform(type: IntentType) {
        switch type {
        case .movies:
            self.logic?.loadData()
        default:
            break
        }
    }
    
    func setupMovies(items: [MovieItem]) {
        self.view?.update(data: items)
    }
    
    func showError(error: Error) {
        self.view?.showError(error: error.localizedDescription)
    }
}
