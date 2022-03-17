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
    
    var body: some View {
        VStack(alignment: .leading) {
            //CHANGE IMAGE FOR ASYNC IMAGE!!!
            
            Image(recipe.id)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            HStack {
                Text(recipe.name)
                    .foregroundColor(.primary)
                    //.shadow(color: .white, radius: 3)
                    .font(.headline)
                    .frame(width: 130, height: 70)
                
                Button {
                    if favImage == "heart" {
                        favImage = "heart.fill"
                    } else {
                        favImage = "heart"
                    }
                } label: {
                    Image(systemName: favImage)
                        .foregroundColor(.red)
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 5, y: 5)
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeCard(recipe: Recipe.example)
    }
}
