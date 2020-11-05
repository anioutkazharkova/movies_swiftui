//
//  ContainerView.swift
//  NewsSwiftUI-mvvm
//
//  Created by 1 on 22.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import SwiftUI

import Foundation
import SwiftUI
import Combine

struct ContainerView<Content>: IContainer, View where Content: View&IModelView {
    @ObservedObject var containerModel = ContainerModel()
    private let content: Content

    public init(content: Content) {
        self.content = content
        content.viewModel?.listener = self
    }

    var body : some View {
        ZStack {
            content
            if (self.containerModel.isLoading) {
                LoaderView()
            }
        }.alert(isPresented: $containerModel.hasError){
            Alert(title: Text(""), message: Text(containerModel.errorText), dismissButton: .default(Text("OK")){
                self.containerModel.errorShown()
                })
        }
    }
    
    func showError(error: String) {
        self.containerModel.setupError(error: error)
    }
    
    func showLoading() {
        self.containerModel.showLoading()
    }
    
    func hideLoading() {
        self.containerModel.hideLoading()
    }
}
