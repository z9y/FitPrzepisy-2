//
//  IngredioentRowView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 03/04/2022.
//

import SwiftUI

struct IngredientRowView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Text("• \(viewModel.ingredients.ingredient)")
                .font(.system(size: 15))
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5) {
                Text(viewModel.amount)
                    
                Text(viewModel.ingredients.unit)
            }
            .font(.system(size: 15))
        }
    }
    
    init(ingredient: Recipe.Ingredient) {
        _viewModel = StateObject(wrappedValue: ViewModel(ingredients: ingredient))
    }
}

struct IngredioentRowView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        IngredientRowView(ingredient: Recipe.example.ingredients[0])
            .environmentObject(modelData)
    }
}
