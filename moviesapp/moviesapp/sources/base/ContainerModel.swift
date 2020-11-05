//
//  ContainerModel.swift
//  NewsSwiftUI-mvvm
//
//  Created by 1 on 23.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
import Combine


class ContainerModel:ObservableObject {
    @Published var hasError: Bool = false
    @Published var errorText: String = ""
    @Published var isLoading: Bool = false
    
    func setupError(error: String){
           self.errorText = error
           if (!error.isEmpty) {
               self.hasError = true
           }
       }
    
    func errorShown() {
        self.hasError = false
        self.errorText = ""
    }
    
    func showLoading() {
        self.isLoading = true
    }
    
    func hideLoading() {
        self.isLoading = false
    }
   
}
