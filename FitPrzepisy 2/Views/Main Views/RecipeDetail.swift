//
//  RecipeDetail.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 03/02/2022.
//

import AlertToast
import StepperView
import SwiftUI

struct RecipeDetail: View {
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject var dataController: DataController
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        ScrollView {
            Image(decorative: viewModel.recipe.id)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            VStack(spacing: 30) {
                Text(viewModel.recipe.name)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                
                VStack {
                    VStack {
                        //TODO OCENA
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        .padding(.bottom, 5)
                        
                        Text("Oceń")
                            .font(.system(size: 10))
                            .padding(.bottom)
                    }
                    
                    HStack {
                        Button {
                            if favorites.contains(viewModel.recipe) {
                                favorites.remove(viewModel.recipe)
                            } else {
                                favorites.add(viewModel.recipe)
                            }
                            
                        } label: {
                            Image(systemName: favorites.contains(viewModel.recipe) ? "heart.fill" : "heart")
                            Text("542")
                        }
                        .padding(.trailing)
                        
                        Button {
                            viewModel.addToList = true
                        } label: {
                            Image(systemName: "cart.badge.plus")
                                .foregroundColor(.primary)
                            Text("Dodaj do listy zakupów")
                        }
                        .padding(.trailing)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                            Text("Wyślij")
                        }
                        .padding(.trailing)
                    }
                    .foregroundColor(.primary)
                    .font(.system(size: 15))
                }
                
                HStack(spacing: 10) {
                    RecipeDetailView(recipe: viewModel.recipe)
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 30) {
                    Text("Składniki")
                        .font(.headline)
                    
                    HStack {
                        Stepper {
                            Text("Porcje: \(viewModel.portions)")
                        } onIncrement: {
                            print("zwiekszone o 1")
                            viewModel.portions += 1
                        } onDecrement: {
                            print("zmniejszone o 1")
                            viewModel.portions -= 1
                        }
                    }
                    
                    ForEach(viewModel.recipe.ingredients, id: \.self) { ingredient in
                        IngredientRowView(ingredient: ingredient)
                    }
                    
                    Divider()
                    
                    Text("Przygotowanie")
                        .font(.headline)

                    StepperView()
                        .addSteps(viewModel.steps)
                        .indicators(viewModel.indicationTypes)
                        .stepIndicatorMode(StepperMode.vertical)
                        .lineOptions(StepperLineOptions.custom(0, Colors.blue(.teal).rawValue))
                        .spacing(30)
                        
                    
                    Divider()
                    Text("Wartości odżywcze na porcje")
                        .font(.headline)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                HStack(spacing: 10) {
                    NutritionView(recipe: viewModel.recipe)
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            }
        }
        .alert("Dodać do listy zakupów?", isPresented: $viewModel.addToList) {
            Button("Dodaj") {
                dataController.addItem(recipe: viewModel.recipe)
                dataController.showAddedToast.toggle()
            }
            Button("Anuluj", role: .cancel) {}
        }
        .toast(isPresenting: $dataController.showAddedToast) {
            AlertToast(type: .complete(.green), title: "Dodano do listy zakupów")
        }
        .edgesIgnoringSafeArea(.top)
        .navigationViewStyle(.stack)
        .environmentObject(dataController)
    }
    
    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: ViewModel(recipe: recipe))
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: Recipe.example)
    }
}
