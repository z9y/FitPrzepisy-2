//
//  IngredioentRowView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 03/04/2022.
//

import SwiftUI

struct IngredioentRowView: View {
    @EnvironmentObject var modelData: ModelData
    
    var ingredients: Recipe.Ingredient
    
    var amount: String {
        switch ingredients.amount {
        case 0:
            return "-"
        case floor(ingredients.amount):
            return "\(Int(ingredients.amount))"
        default:
            return String(format: "%.2f", ingredients.amount)
        }
    }
    
    var body: some View {
        HStack {
            Text("• \(ingredients.ingredient)")
                .font(.system(size: 15))
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5) {
                Text(amount)
                    .font(.system(size: 15))
                
                Text(ingredients.unit)
                    .font(.system(size: 15))
            }
        }
    }
}

struct IngredioentRowView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        IngredioentRowView(ingredients: Recipe.example.ingredients[0])
            .environmentObject(modelData)
    }
}
