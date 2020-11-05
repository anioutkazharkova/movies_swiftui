//
//  View+Any.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import SwiftUI

extension View {
    func toAny()->AnyView {
        return AnyView(self)
    }
}
