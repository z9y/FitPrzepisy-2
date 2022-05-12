//
//  RecipeDetail-ViewModel.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 24/04/2022.
//

import SwiftUI

extension RecipeDetail {
    @MainActor class ViewModel: ObservableObject {
        @StateObject var favorites = Favorites()
        @Published var addToList = false
        @Published var portions = 2
        
        var recipe: Recipe
        
        init(recipe: Recipe) {
            self.recipe = recipe
        }
    }
}
