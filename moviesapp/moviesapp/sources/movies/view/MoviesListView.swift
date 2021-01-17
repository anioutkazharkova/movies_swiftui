//
//  MoviesListView.swift
//  moviesapp
//
//  Created by Anna Zharkova on 05.11.2020.
//

import SwiftUI

protocol IMoviesListView : IModelView {
}

struct MoviesListView: View, IMoviesListView {
    
    
    var viewModel: IModel? {
        return model
    }
    @ObservedObject var model: MoviesListModel = MoviesListModel()

   // @ObservedObject var vm: MoviesListViewModel = MoviesListViewModel()
    var processor: IProcessor? = nil 
    
    var body: some View {
        NavigationView{
        List(model.data) { item in
            NavigationLink(
                destination: Navigator.shared.create(type: MoviesItemView.self, data: item),
                label: {
                MoviesItemRow(data: item)
                })
        }.navigationBarTitle("", displayMode: .inline).onAppear(){
           // self.vm.loadMovies()
            self.processor?.perform(type: .movies)
        }
        }
    }
    
    func update(data: Any?) {
        self.model.update(data: data)
    }
}

