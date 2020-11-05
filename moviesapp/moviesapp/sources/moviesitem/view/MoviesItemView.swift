//
//  MoviesItemView.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import SwiftUI

struct MoviesItemView: View {
    @ObservedObject var model: MoviesItemModel = MoviesItemModel()
    
    init(){}
    
    init(data: MovieItem) {
        self.init()
        self.model.data = data
    }
    
    var body: some View {
        ScrollView {
        VStack(alignment: .leading, spacing: 0){
            VStack(alignment: .center) {
            CachedImage(withURL: model.data?.imagePath ?? "")
            }
            Text(model.data?.title ?? "").font(.system(size: 22)).bold().padding(EdgeInsets(top: 20,leading: 20,bottom: 0,trailing: 20))
            Text(model.data?.releaseDate.formatToString("dd.MM.yyyy") ?? "").font(.system(size: 12)).padding(EdgeInsets(top: 10,leading: 20,bottom: 0,trailing: 10))
            Text(model.data?.overview ?? "").font(.system(size: 17)).padding(EdgeInsets(top: 10,leading: 20,bottom: 20,trailing: 20))
            
            Spacer()
        }
        }
        .navigationBarTitle(Text(model.data?.title ?? ""), displayMode: .inline)
        
    }
}

