//
//  CategoryItem.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 01/02/2022.
//

import SwiftUI

struct RecipeCard: View {
    @EnvironmentObject var modelData: ModelData
    @State private var favImage = "heart"
    
    var recipe: Recipe
    var width: CGFloat
    var heigth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            RecipeCardHelper(recipe: recipe, width: width, heigth: heigth)
            
            Text(recipe.name)
                .foregroundColor(.primary)
                .font(.headline)
                .frame(width: width, height: 80)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 3, y: 3)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeCard(recipe: Recipe.example, width: 240, heigth: 300)
    }
}
