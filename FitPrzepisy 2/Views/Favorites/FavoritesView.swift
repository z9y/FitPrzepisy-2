//
//  FavoritesView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/03/2022.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var favorites: Favorites
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(modelData.recipes) { recipe in
                        if favorites.contains(recipe) {
                            NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                                RecipeCard(recipe: recipe, width: 170, heigth: 210)
                            }
                            .padding(.top)
                        }
                    }
                }
            }
            .navigationTitle("Ulubione")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(Favorites())
    }
}
