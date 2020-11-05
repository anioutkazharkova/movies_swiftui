//
//  ImageLoader.swift
//  NewsSwiftUI
//
//  Created by 1 on 16.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<UIImage, Never>()
    var data = UIImage() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        ImageManager.sharedInstance.receiveImage(forKey: urlString) { (im) in
            DispatchQueue.main.async {
                self.data = im
            }
        }
    }
}
