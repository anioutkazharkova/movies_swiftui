//
//  IConfig.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation
import SwiftUI

protocol IConfig: class {
    func createScreen(_ data: Any?) -> AnyView
}

class Configurator{
    static let shared = Configurator()
    func config<Content:View>(type: Content.Type)->IConfig? {
        if type == MoviesListView.self {
            return MoviesConfig.shared
        }
        if type == SearchView.self {
            return SearchConfig.shared
        }
        if type == MoviesItemView.self {
            return MoviesItemConfig.shared
        }
        return nil 
    }
}
