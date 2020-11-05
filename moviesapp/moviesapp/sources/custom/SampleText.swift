//
//  SampleText.swift
//  NewsSwiftUI
//
//  Created by 1 on 16.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import SwiftUI

struct SampleText: View {
    @State var text: String
    
    var body: some View {
        Text(text).font(.system(size: 17)).foregroundColor(.black)
    }
}
