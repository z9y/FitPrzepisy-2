//
//  CategoryItem.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 01/02/2022.
//

import SwiftUI

struct RecipeCard: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var favorites: Favorites
    
    var recipe: Recipe
    var width: CGFloat
    var heigth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            RecipeCardHelper(favorites: favorites, recipe: recipe, width: width, heigth: heigth)
                
            Text(recipe.name)
                .foregroundColor(.primary)
                .font(.title3.weight(.semibold))
                .frame(width: width, height: 80)
                .multilineTextAlignment(.leading)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeCard(recipe: Recipe.example, width: 240, heigth: 300)
    }
}
