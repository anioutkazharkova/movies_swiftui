//
//  SearchConfig.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation

import SwiftUI

class SearchConfig: IConfig {
    static let shared = SearchConfig()
    
    func createScreen(_ data: Any?) -> AnyView {
        var view = SearchView()
        let processor = SearchProcessor()
        let logic = SearchLogic()
        processor.logic = logic
        processor.view = view
        logic.output = processor
        view.processor = processor
        return view.toAny()
    }
}
