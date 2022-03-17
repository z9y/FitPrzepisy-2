//
//  HomeView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/03/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    if modelData.features.isEmpty {
                        ProgressView()
                            .frame(height: 300)
                    } else {
                        PageView(pages: modelData.features.map {
                            FeatureCard(recipe: $0)
                        })
                            .aspectRatio(3 / 2, contentMode: .fill)
                    }
                    
                    ForEach(modelData.categories.keys.sorted().reversed(), id: \.self) { key in
                        Divider()
                        CategoryRow(recipes: modelData.categories[key]!, categoryName: key)
                    }
                }
                .navigationTitle("Nowość")

            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeDetail(recipe: Recipe.example)
            .environmentObject(modelData)
    }
}
