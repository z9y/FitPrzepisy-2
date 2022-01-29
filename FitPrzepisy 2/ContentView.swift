//
//  ContentView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 29/01/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    if modelData.features.isEmpty {
                        ProgressView()
                            .foregroundColor(.cyan)
                            .frame(height: 300)
                    } else {
                        Text("Nowości")
                            .font(.title.bold())
                        PageView(pages: modelData.features.map {
                            FeatureCard(recipe: $0)
                        })
                            .aspectRatio(3 / 2, contentMode: .fit)
                    }
                    
                    ForEach(modelData.recipes) { recipe in
                        Text(recipe.name)
                        
                        Image(recipe.id)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                }
                .navigationTitle("FitPrzepisy")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
