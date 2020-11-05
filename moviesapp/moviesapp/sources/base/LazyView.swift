//
//  LazyView.swift
//  NewsSwiftUI-mvvm
//
//  Created by 1 on 22.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
import Foundation
import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
