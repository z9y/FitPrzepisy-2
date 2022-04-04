//
//  RecipeDetail.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 03/02/2022.
//

import SwiftUI

struct RecipeDetail: View {
    @EnvironmentObject var modelData: ModelData
    @State private var addToList = false
    
    var recipe: Recipe
    
    var body: some View {
            ScrollView {
                Image(decorative: recipe.id)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                
                VStack(spacing: 30) {
                    Text(recipe.name)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 10) {
                        RecipeDetailView(recipe: recipe)
                    }
                    .padding(.vertical)
                    .background(Color.primary.opacity(0.1))
                    .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                    
                    HStack(spacing: 10) {
                        NutritionView(recipe: recipe)
                    }
                    .padding(.vertical)
                    .background(Color.primary.opacity(0.1))
                    .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                    
                    
                    Divider()

                    VStack(alignment: .leading, spacing: 30) {
                        Text("Składniki")
                            .font(.headline)
                        
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            IngredioentRowView(ingredients: ingredient)
                        }
                        
                        Divider()
                        
                        Text("Przygotowanie")
                            .font(.headline)
                        
                        ForEach(recipe.preparation, id: \.self) { step in
                            Text("• \(step)")
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .alert("Dodać do listy zakupów?", isPresented: $addToList) {
                Button("Dodaj") {
//                    addItem()
                }
                Button("Anuluj", role: .cancel) {}
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        addToList = true
                    } label: {
                        Image(systemName: "cart.badge.plus")
                            .foregroundColor(.primary)
                    }
                    Button {
                        //dodaj do ulubionych
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.primary)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationViewStyle(.stack)
    }
    
//    func addItem() {
//        _ = recipe.ingredients.map {
//            modelData.addItem(name: $0)
//        }
//    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeDetail(recipe: Recipe.example)
            .environmentObject(modelData)
    }
}
