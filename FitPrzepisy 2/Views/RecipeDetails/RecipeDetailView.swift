//
//  RecipeDetailView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 22/03/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    //PRZENIESC DO HELPERS
    var level: String {
        switch recipe.details.level {
        case 1:
            return "Łatwy ✌️"
        case 2:
            return "Średni 👍"
        default:
            return "Trudny 👊"
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Poziom")
                    .font(.caption.bold())
                    .padding(.bottom, 5)
                Text(level)
                    .font(.subheadline)
            }
            
            VStack {
                Text("Przygotowanie")
                    .font(.caption.bold())
                    .padding(.bottom, 5)
                Text("\(recipe.details.preparationTime) min")
                    .font(.subheadline)
            }
            
            VStack {
                Text("Czas całkowity")
                    .font(.caption.bold())
                    .padding(.bottom, 5)
                Text("\(recipe.details.totalTime) min")
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.example)
    }
}
