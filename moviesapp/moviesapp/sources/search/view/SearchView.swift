//
//  SearchView.swift
//  moviesapp
//
//  Created by Anna Zharkova on 05.11.2020.
//

import SwiftUI

protocol ISearchView : IModelView {
    
}

struct SearchView: View, ISearchView {
   
    @State private var text: String = ""
    @ObservedObject var model: SearchModel = SearchModel()
    var processor: IProcessor? = nil
    var viewModel: IModel? {
        return model
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: self.$text){(search) in
                    DispatchQueue.main.async {
                        self.processor?.perform(type: .search(text: search))
                    }
                }
                List(model.data) { item in
                    NavigationLink(
                        destination: Navigator.shared.create(type: MoviesItemView.self, data: item),
                        label: {
                            MoviesItemRow(data: item)
                        })
                }
            }.navigationBarHidden(true)
        }
    }
    
    func update(data: Any?) {
        self.model.update(data: data)
    }
    
    func showError(error: String) {
        self.model.showError(error: error)
    }
    
}


