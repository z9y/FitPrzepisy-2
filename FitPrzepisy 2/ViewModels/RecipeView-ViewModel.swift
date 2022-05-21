//
//  RecipeView-ViewModel.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 18/05/2022.
//

import StepperView
import SwiftUI

extension RecipeView {
    @MainActor class ViewModel: ObservableObject {
        @StateObject var favorites = Favorites()
        @Published var addToList = false
        @Published var portions = 2
        @Published var steps: [Text] = []
        @Published var indicationTypes: [StepperIndicationType<NumberedCircleView>] = []
        @Published var appear = [false, false, false]
        @Namespace var namespace
        
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
