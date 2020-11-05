//
//  MainView.swift
//  moviesapp
//
//  Created by Anna Zharkova on 05.11.2020.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Navigator.shared.create(type: MoviesListView.self, data: nil).tabItem {
                Text("Фильмы")
           }.tag("0")
            Navigator.shared.create(type: SearchView.self, data: nil).tabItem {
                Text("Поиск")
            }.tag("1")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
