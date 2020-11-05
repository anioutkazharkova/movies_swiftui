//
//  ThumbImage.swift
//  TestNewsSearch
//
//  Created by 1 on 15.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
import SwiftUI

struct ThumbImage : View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        
        Image(uiImage: image).resizable().aspectRatio(contentMode: .fill).frame(width: CGFloat(100), height: CGFloat(150), alignment: .center).clipped().onReceive(imageLoader.didChange) { im in
            self.image = im
        }
    }
    
}
