//
//  MoviesConfig.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation
import SwiftUI

class MoviesConfig: IConfig {
    static let shared = MoviesConfig()
    
    func createScreen(_ data: Any?) -> AnyView {
        var view = MoviesListView()
        let processor = MoviesListProcessor()
        let logic = MoviesListLogic()
        processor.logic = logic
        processor.view = view
        logic.output = processor
        view.processor = processor
        return view.toAny()
    }
}
