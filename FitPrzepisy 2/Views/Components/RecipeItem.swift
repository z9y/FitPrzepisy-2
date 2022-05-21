//
//  RecipeItem.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 18/05/2022.
//

import SwiftUI

struct RecipeItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @EnvironmentObject var favorites: Favorites
    @State private var isPressed = false
    
    let recipe: Recipe
    
    var cardWidth: CGFloat = 230
    var cardHeigth: CGFloat = 450
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.clear)
                    .matchedGeometryEffect(id: "mask\(recipe.id)", in: namespace)
                
                cover
                
            }
            .frame(width: cardWidth, height: cardHeigth)
        }
    }
    
    var cover: some View {
        
        // MARK: Cover for rounded rectangle with info about recipe
        VStack(alignment: .leading, spacing: 12) {
            Image(recipe.id)
                .resizable()
                .cornerRadius(20)
                .frame(width: 230, height: 300)
                .matchedGeometryEffect(id: "image\(recipe.id)", in: namespace)
                .overlay(alignment: .bottom) {
                    overlay
                }
            
            Text(recipe.name)
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)
                .matchedGeometryEffect(id: "title\(recipe.id)", in: namespace)
            HStack {
                Image("Avatar 1")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
                
                VStack {
                    Text("Jan Nowak")
                        .font(.body)
                    Text("Fit Przepisy")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.bottom, 5)
        }
    }
    
    var overlay: some View {
        
        // MARK: Overlay on the photo of the recipe card
        ZStack(alignment: .bottom) {
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.5), .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
                .cornerRadius(20)
            HStack {
                Button {
                    if favorites.contains(recipe) {
                        favorites.remove(recipe)
                    } else {
                        favorites.add(recipe)
                    }
                    withAnimation(.spring(response: 0.9, dampingFraction: 0.9, blendDuration: 0.9)) {
                        isPressed.toggle()
                    }
                } label: {
                    Image(systemName: favorites.contains(recipe) ? "heart.fill" : "heart")
                        .foregroundColor(.green)
                        .rotationEffect(.degrees(isPressed ? 360 : 0))
                        .matchedGeometryEffect(id: "likeButton\(recipe.id)", in: namespace)
                    Text("1256")
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("\(recipe.details.totalTime) min.")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "time\(recipe.id)", in: namespace)
            }
            .padding()
        }
    }
        
//        var stare: some View {
//            VStack {
//                Image(recipe.id)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .matchedGeometryEffect(id: "image\(recipe.id)", in: namespace)
//                Spacer()
//                VStack(alignment: .leading, spacing: 12) {
//                    Text(recipe.name)
//                        .fixedSize(horizontal: false, vertical: true)
//                        .font(.headline)
//                        .matchedGeometryEffect(id: "title\(recipe.id)", in: namespace)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                    HStack {
//                        Button {
//                            if favorites.contains(recipe) {
//                                favorites.remove(recipe)
//                            } else {
//                                favorites.add(recipe)
//                            }
//                        } label: {
//                            Image(systemName: "heart.fill")
//                                .foregroundColor(.green)
//                                .matchedGeometryEffect(id: "likeButton\(recipe.id)", in: namespace)
//                        }
//                        Spacer()
//                        Text("\(recipe.details.totalTime) min")
//                            .font(.footnote.weight(.semibold))
//                            .matchedGeometryEffect(id: "time\(recipe.id)", in: namespace)
//                    }
//                }
//                //            .padding(20)
//                .background {
//                    Rectangle()
//                        .fill(.ultraThinMaterial)
//                        .mask (RoundedRectangle(cornerRadius: 30, style: .continuous))
//                    //                            .blur(radius: 15)
//                        .matchedGeometryEffect(id: "blue\(recipe.id)", in: namespace)
//                }
//                .frame(height: 500)
//                .offset(y: -50)
//            }
//            .frame(width: cardWidth, height: cardHeigth)
//            .foregroundColor(.primary)
//            .mask {
//                RoundedRectangle(cornerRadius: 30, style: .continuous)
//                    .matchedGeometryEffect(id: "mask\(recipe.id)", in: namespace)
//            }
//            .padding(.trailing, 10)
//            .padding(.top, 20)
//        }
    }
    
    //MARK: TODO preview

//    struct RecipeItem_Previews: PreviewProvider {
//        @Namespace static var namespace
//        
//        static var previews: some View {
//            RecipeItem(namespace: namespace, show: .constant(true), favorites: Favorites.example, recipe: Recipe.example)
//        }
//    }
