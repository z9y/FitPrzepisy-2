//
//  RecipeGridView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 17/03/2022.
//

import SwiftUI

struct RecipeGridView: View {
    var recipes = [Recipe]()
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 10)
    ]
    
    //do wyrzucenia
    var recipesCountName: String {
        if recipes.count == 1 {
            return "przepis"
        } else if recipes.count > 1 && recipes.count < 5 {
            return "przepisy"
        } else {
            return "przepisów"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipesCountName)")
                    .font(.headline.weight(.medium))
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                        RecipeCard(recipe: recipe, width: 170, heigth: 210)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeGridView()
    }
}
