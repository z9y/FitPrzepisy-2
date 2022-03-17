//
//  RecipeDetail.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 03/02/2022.
//

import SwiftUI

struct RecipeDetail: View {
    @EnvironmentObject var modelData: ModelData
    var recipe: Recipe
    
    var body: some View {
//        GeometryReader { geo in
            ScrollView {
                Image(decorative: recipe.id)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                
                VStack(spacing: 30) {
                    Text(recipe.name)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    
                    //ADD DETAILS HERE
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Składniki")
                            .font(.headline)
                        
//                        IngredientsList(recipe: recipe)
//                            .frame(width: geo.size.width, height: geo.size.height)
                        
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            Text("• \(ingredient)")
                        }
                        
                        Divider()
                        
                        Text("Przygotowanie")
                            .font(.headline)
                        
                        ForEach(recipe.preparation, id: \.self) { step in
                            Text("• \(step)")
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
    //        .navigationTitle("\(recipe.name)")
            .ignoresSafeArea()
            .navigationViewStyle(.stack)
//        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeDetail(recipe: Recipe.example)
            .environmentObject(modelData)
    }
}
