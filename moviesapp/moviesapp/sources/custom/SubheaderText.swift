//
//  SubheaderText.swift
//  TestNewsSearch
//
//  Created by 1 on 15.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
import SwiftUI


struct SubheaderText: View {
    @State var text: String
    
    var body: some View {
          Text(text).font(.system(size: 15))
    }
}
