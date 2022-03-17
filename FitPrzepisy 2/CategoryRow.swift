//
//  CategoryRow.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 02/02/2022.
//

import SwiftUI

struct CategoryRow: View {
    var recipes: [Recipe]
    var categoryName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(categoryName)
                    .font(.headline)
                    .padding(.leading, 15)
                
                Spacer()
                
                //MORE BUTTON
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(recipes) { recipe in
                        NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(recipes: [Recipe.example] ,categoryName: "Śniadanie")
    }
}
