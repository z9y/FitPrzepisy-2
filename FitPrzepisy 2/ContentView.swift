//
//  ContentView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 29/01/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Nowość", systemImage: "safari")
                    }

                CategoryView()
                    .tabItem {
                        Label("Kategorie", systemImage: "square.fill.text.grid.1x2")
                    }

                FavoritesView()
                    .tabItem {
                        Label("Ulubione", systemImage: "heart")
                    }

                ShoppingListView()
                    .tabItem {
                        Label("Lista zakupów", systemImage: "checklist")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
