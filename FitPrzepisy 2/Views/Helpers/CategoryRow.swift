//
//  CategoryRow.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 02/02/2022.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var favorites: Favorites
    var recipes: [Recipe]
    var categoryName: String
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    
    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Text(categoryName)
//                    .font(.headline)
//                    .padding(.leading, 15)
//
//                Spacer()
//
//                //MORE BUTTON ??
//            }
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHStack(alignment: .top, spacing: 4) {
//                    ForEach(recipes) { recipe in
//                        NavigationLink(destination: RecipeDetail(recipe: recipe)) {
//                            RecipeCard(recipe: recipe, width: 200, heigth: 280)
//                                .padding(.horizontal, 8)
//                        }
//                    }
//                }
//            }
//        }
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                //                    ForEach(modelData.categories.keys.sorted().reversed(), id: \.self) { key in
                //                        CategoryRow(recipes: modelData.categories[key]!, categoryName: key)
                //                            .padding(.bottom, 15)
                //                    }
                
                if !show {
                    LazyHStack(alignment: .top, spacing: 5) {
                        ForEach(recipes) { recipe in
                            RecipeItem(namespace: namespace, show: $show, favorites: _favorites, recipe: recipe)
                                .onTapGesture {
                                    withAnimation(.openCard) {
                                        show.toggle()
                                        showStatusBar = false
                                    }
                                }
                        }
                    }
                }
            }

            if show {
                RecipeView(recipe: Recipe.example, show: $show, namespace: namespace)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.3))))
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
        
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(recipes: [Recipe.example] ,categoryName: "Śniadanie")
    }
}








