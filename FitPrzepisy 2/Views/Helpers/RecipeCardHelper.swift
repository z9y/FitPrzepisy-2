//
//  RecipeCardHelper.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 09/04/2022.
//

import SwiftUI

struct RecipeCardHelper: View {
    var favorites: Favorites
    var recipe: Recipe
    var width: CGFloat
    var heigth: CGFloat
    
    var body: some View {
        Image(recipe.id)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: heigth)
            .overlay {
                TextOverlayy(favorites: favorites, recipe: recipe)
            }
            .cornerRadius(10)
    }
}

struct TextOverlayy: View {
    @StateObject var favorites: Favorites
    var recipe: Recipe
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.5), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center
        )
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            gradient
            HStack {
                Button {
                    //MOŻNA PRZERZUCIC ? 
                    if favorites.contains(recipe) {
                        favorites.remove(recipe)
                    } else {
                        favorites.add(recipe)
                    }
                } label: {
                    Image(systemName: favorites.contains(recipe) ? "heart.fill" : "heart")
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Text("\(recipe.details.totalTime) min.")
                    .font(.system(size: 15))
            }
            .font(.headline.bold())
            .foregroundColor(.white)
            .shadow(color: .black, radius: 3)
            .padding(8)
        }
        .foregroundColor(.white)
    }
}
