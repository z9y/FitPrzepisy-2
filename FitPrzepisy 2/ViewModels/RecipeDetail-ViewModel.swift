//
//  RecipeDetail-ViewModel.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 24/04/2022.
//

import StepperView
import SwiftUI

extension RecipeDetail {
    @MainActor class ViewModel: ObservableObject {
        @StateObject var favorites = Favorites()
        @Published var addToList = false
        @Published var portions = 2
        @Published var steps: [Text] = []
        @Published var indicationTypes: [StepperIndicationType<NumberedCircleView>] = []
        
        var recipe: Recipe

        func addSteps() {
            _ = recipe.preparation.map { step in
                steps.append(Text("\(step)").font(.caption))
                indicationTypes.append(StepperIndicationType.custom(NumberedCircleView(text: "\(recipe.preparation.firstIndex(where: { $0 == step })! + 1)")))
            }
        }
        
        init(recipe: Recipe) {
            self.recipe = recipe
            addSteps()
        }
    }
}


//
//var content: some View {
//
//    
//    VStack(alignment: .leading, spacing: 30) {
//        Text("Składniki")
//            .font(.headline)
//        
//        HStack {
//            Stepper {
//                Text("Porcje: \(Recipe.example.portions)")
//            } onIncrement: {
//                print("zwiekszone o 1")
//                viewModel.portions += 1
//            } onDecrement: {
//                print("zmniejszone o 1")
//                viewModel.portions -= 1
//            }
//        }
//        
//        ForEach(Recipe.example.ingredients, id: \.self) { ingredient in
//            IngredientRowView(ingredient: ingredient)
//        }
//        
//        Divider()
//        
//        Text("Przygotowanie")
//            .font(.headline)
//
//        StepperView()
//            .addSteps(viewModel.steps)
//            .indicators(viewModel.indicationTypes)
//            .stepIndicatorMode(StepperMode.vertical)
//            .lineOptions(StepperLineOptions.custom(0, .green))
//            .spacing(30)
//            
//        
//        Divider()
//        Text("Wartości odżywcze na porcje")
//            .font(.headline)
//    }
//    .padding(.horizontal)
//}
