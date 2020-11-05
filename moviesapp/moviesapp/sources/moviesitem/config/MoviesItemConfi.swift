//
//  MoviesItemConfi.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation
import SwiftUI

class MoviesItemConfig: IConfig {
    static let shared = MoviesItemConfig()
    
    func createScreen(_ data: Any?) -> AnyView {
        var view: MoviesItemView? = nil
        if let data = data as? MovieItem {
            view = MoviesItemView(data: data)
        }
        else {
            view = MoviesItemView()
        }
        return view.toAny()
    }
}
