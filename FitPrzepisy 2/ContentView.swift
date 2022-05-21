//
//  ContentView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 29/01/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @StateObject var modelData = ModelData()
    @StateObject var favorites = Favorites()
    @StateObject var dataController = DataController()
    
    var body: some View {
        if modelData.features.isEmpty {
            ProgressView()
                .frame(height: 300)
        } else {
            ZStack(alignment: .bottom) {

                switch selectedTab {
                case .home:
                    HomeView()
                case .category:
                    CategoryView()
                case .favorites:
                    FavoritesView()
                case .shoppingList:
                    ShoppingListView()
                }

                TabBar()
                    .offset(y: modelData.showDetail ? 200 : 0)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 44)
            }
            .environmentObject(modelData)
            .environmentObject(favorites)
            .environmentObject(dataController)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
