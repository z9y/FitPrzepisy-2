//
//  CategoryView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 15/03/2022.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Recipe.Category.allCases) { category in
                    NavigationLink {
                        ScrollView {
                            RecipeGridView(recipes: modelData.recipes.filter{ $0.category.rawValue == category.rawValue })
                        }
                        .navigationTitle(category.rawValue)
                    } label: {
                        Text(category.rawValue)
                    }
                }
            }
            .navigationTitle("Kategorie")
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CategoryView()
            .environmentObject(modelData)
    }
}
