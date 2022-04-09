//
//  CategoryItem.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 01/02/2022.
//

import SwiftUI

struct RecipeCard: View {
    @EnvironmentObject var modelData: ModelData
    @State private var favImage = "heart"
    
    var recipe: Recipe
    var width: CGFloat
    var heigth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
//            ZStack(alignment: .bottom) {
//                //CHANGE IMAGE FOR ASYNC IMAGE!!!
//                Image(recipe.id)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 240, height: 300)
//                    .cornerRadius(5)
//
//                HStack {
//                    Button {
//                        print("klik favorite")
//                    } label: {
//                        Image(systemName: "heart")
//                    }
//
//                    Spacer()
//
//                    Text("35 min.")
//                }
//                .font(.headline.bold())
//                .foregroundColor(.white)
//                .shadow(color: .black, radius: 3)
//                .padding(8)
//            }
            
            RecipeCardHelper(recipe: recipe, width: width, heigth: heigth)
            
            Text(recipe.name)
                .foregroundColor(.primary)
                .font(.headline)
                .frame(width: width, height: 80)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                
            
//            HStack {
//            Text(recipe.name)
//                .foregroundColor(.primary)
//                //.shadow(color: .white, radius: 3)
//                .font(.headline)
//                .frame(width: 130, height: 70)
//                .multilineTextAlignment(.leading)
                
//                Button {
//                    if favImage == "heart" {
//                        favImage = "heart.fill"
//                        modelData.addToFavorites(recipe: recipe)
//                    } else {
//                        favImage = "heart"
//                    }
//                } label: {
//                    Image(systemName: favImage)
//                        .foregroundColor(.red)
//                }
//            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 3, y: 3)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeCard(recipe: Recipe.example, width: 240, heigth: 300)
    }
}
