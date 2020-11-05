//
//  Navigator.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation
import SwiftUI

class Navigator {
    static let shared = Navigator()
    
    func create<Content:View>(type: Content.Type, data: Any?)->AnyView? {
        if let view = Configurator.shared.config(type: type)?.createScreen(data) {
            return view
        }
        return EmptyView().toAny()
    }
}
