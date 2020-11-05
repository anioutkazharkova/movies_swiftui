//
//  MoviesItemRow.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import SwiftUI

struct MoviesItemRow: View {
    @State var data: MovieItem
    
    var body: some View {
        VStack {
            HStack {
                ThumbImage(withURL: data.imagePath)
                VStack(alignment: .leading,spacing: 10) {
                    HeaderText(text: data.title)
                    SubheaderText(text: data.overview).lineLimit(3)
                    SmallText(text: data.releaseDate.formatToString("dd.MM.yyyy"))
                }
                .fixedSize(horizontal: false,
                           vertical: true)
                
                .padding(.all,8)
                  
            }
            .fixedSize(horizontal: false,
                       vertical: true)
        }
        .background(Color.white)
    }
}

