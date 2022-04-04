//
//  FavoritesView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/03/2022.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeGridView(recipes: modelData.favorites)
            }
            .navigationTitle("Ulubione")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
