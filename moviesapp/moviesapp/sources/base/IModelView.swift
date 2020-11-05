//
//  IModelView.swift
//  NewsSwiftUI-mvvm
//
//  Created by 1 on 22.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation

protocol IModelView {
    var viewModel: IModel? {get}
    
    func update(data: Any?)
}
