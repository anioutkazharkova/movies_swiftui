//
//  MoviesItemModel.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation
import Foundation
import SwiftUI
import Combine

class MoviesItemModel : ObservableObject, IModel{
    @Published  var data:MovieItem? = nil
    var listener: IContainer?
    
    func update(data: Any?) {
        if let data = data as? MovieItem{
            self.data = data
        }
    }
}
