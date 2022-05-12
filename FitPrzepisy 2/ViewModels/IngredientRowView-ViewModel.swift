//
//  IngredientRowView-ViewModel.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 25/04/2022.
//

import SwiftUI

extension IngredientRowView {
    @MainActor class ViewModel: ObservableObject {
        var ingredients: Recipe.Ingredient
        
        init(ingredients: Recipe.Ingredient) {
            self.ingredients = ingredients
        }
        
        
        //Przeniesc !!! do helpers ???
        var amount: String {
            switch ingredients.amount {
            case 0:
                return "-"
            case floor(ingredients.amount):
                return "\(Int(ingredients.amount))"
            default:
                return String(format: "%.2f", ingredients.amount)
            }
        }
    }
}
