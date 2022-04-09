//
//  RecipeDetail.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 03/02/2022.
//

import StepperView
import SwiftUI

struct RecipeDetail: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.managedObjectContext) var moc
    @State private var addToList = false
    @State private var portions = 2
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            Image(decorative: recipe.id)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            VStack(spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                
                VStack {
                    VStack {
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
                            
                        } label: {
                            Image(systemName: "heart")
                            Text("542")
                        }
                        .padding(.trailing)
                        
                        Button {
                            addToList = true
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
                    RecipeDetailView(recipe: recipe)
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
                            Text("Porcje: \(portions)")
                        } onIncrement: {
                            print("zwiekszone o 1")
                            portions += 1
                        } onDecrement: {
                            print("zmniejszone o 1")
                            portions -= 1
                        }
                    }
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        IngredioentRowView(ingredients: ingredient)
                    }
                    
                    Divider()
                    
                    Text("Przygotowanie")
                        .font(.headline)
                    
                    ForEach(recipe.preparation, id: \.self) { step in
                        //                        Text("• \(step)")
                        StepperView()
                            .addSteps([
                                Text("\(step)").font(.caption)
                            ])
                            .indicators([
                                StepperIndicationType.custom(NumberedCircleView(text: "1"))
                            ])
                            .stepIndicatorMode(StepperMode.vertical)
                        //                            .spacing(30)
                        //                            .lineOptions(StepperLineOptions.rounded(4, 8, Color.black))
                        
                    }
                    Divider()
                    Text("Wartości odżywcze na porcje")
                        .font(.headline)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                HStack(spacing: 10) {
                    NutritionView(recipe: recipe)
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
            }
        }
        .alert("Dodać do listy zakupów?", isPresented: $addToList) {
            Button("Dodaj") {
                addItem()
            }
            Button("Anuluj", role: .cancel) {}
        }
        //            .toolbar {
        //                ToolbarItemGroup(placement: .navigationBarTrailing) {
        //                    Button {
        //                        addToList = true
        //                    } label: {
        //                        Image(systemName: "cart.badge.plus")
        //                            .foregroundColor(.primary)
        //                    }
        //                    Button {
        ////                        addItem()
        //                    } label: {
        //                        Image(systemName: "heart.fill")
        //                            .foregroundColor(.primary)
        //                    }
        //                }
        //            }
        .edgesIgnoringSafeArea(.top)
        .navigationViewStyle(.stack)
    }
    
    func addItem() {
        _ = recipe.ingredients.map { ingredient in
            //            print("\(ingredient.ingredient)" + " " + "\(ingredient.amount)" + " " + "\(ingredient.unit)")
            
            var amount: String {
                switch ingredient.amount {
                case 0:
                    return "-"
                case floor(ingredient.amount):
                    return "\(Int(ingredient.amount))"
                default:
                    return String(format: "%.2f", ingredient.amount)
                }
            }
            
            
            let newItem = Item(context: moc)
            newItem.id = UUID()
            newItem.isBought = false
            newItem.name = "\(ingredient.ingredient)" + " " + "\(amount)" + " " + "\(ingredient.unit)"
            
            try? moc.save()
        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeDetail(recipe: Recipe.example)
            .environmentObject(modelData)
    }
}
