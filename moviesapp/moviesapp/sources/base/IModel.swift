//
//  IModel.swift
//  NewsSwiftUI-mvvm
//
//  Created by 1 on 22.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
protocol  IModel:class {
    func update(data: Any?)
    var listener:IContainer? {get set}
    
}


protocol  IContainer {
    func showError(error: String)
    
    func showLoading()
    
    func hideLoading()
}
