//
//  NutritionView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 03/04/2022.
//

import SwiftUI

struct NutritionView: View {
    let recipe: Recipe
    
    var body: some View {
        Group {
            VStack {
                Text("Energia")
                    .font(.caption.bold())
                Text("\(toString(cos: recipe.macro.kcal)) kcal")
                    .font(.subheadline)
            }
            
            VStack {
                Text("Węglowodany")
                    .font(.caption.bold())
                Text("\(toString(cos: recipe.macro.carbohydrates)) gram")
                    .font(.subheadline)
            }
            
            VStack {
                Text("Białko")
                    .font(.caption.bold())
                Text("\(toString(cos: recipe.macro.protein)) gram")
                    .font(.subheadline)
            }
            
            VStack {
                Text("Tłuszcz")
                    .font(.caption.bold())
                Text("\(toString(cos: recipe.macro.fat)) gram")
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    func toString(cos: Double) -> String {
        switch cos {
        case floor(cos):
            return "\(Int(cos))"
        default:
            return String(format: "%.1f", cos)
        }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView(recipe: Recipe.example)
    }
}
