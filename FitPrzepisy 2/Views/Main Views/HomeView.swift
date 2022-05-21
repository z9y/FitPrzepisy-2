//
//  HomeView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/03/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var favorites: Favorites
    @State private var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = String()
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                featuredItems
                          
                Text("Ostatnio dodane")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                          
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 12) {
                        if !show {
                            recipesCards
                        } else {
                            ForEach(modelData.recipes.suffix(4)) { recipe in
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 450)
                                    .cornerRadius(30)
                                    .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                                    .opacity(0.3)
                                    .padding(.horizontal, 30)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(hasScrolled: $hasScrolled, title: "Nowość")
            )
            if show {
                recipeDetail
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
    
    var featuredItems: some View {
        TabView {
            ForEach(modelData.features) { recipe in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    HomeCardView(recipe: recipe)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            recipe.featureImage!
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 250)
                                .cornerRadius(30)
                                .offset(x: 45, y: -90)
                                .offset(x: minX / 3)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 450)
        .background(
            Image("Bubbles")
                .resizable()
                .frame(width: 400, height: 400)
                .offset(x: 150, y: -100)
        )
    }
    
    var recipesCards: some View {
        ForEach(modelData.recipes.suffix(4)) { recipe in
            RecipeItem(namespace: namespace, show: $show, favorites: _favorites, recipe: recipe)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        modelData.showDetail.toggle()
                        showStatusBar = false
                        selectedID = recipe.id
                    }
                }
        }
    }
    
    var recipeDetail: some View {
        ForEach(modelData.recipes.suffix(4)) { recipe in
            if recipe.id == selectedID {
                RecipeView(recipe: recipe, show: $show, namespace: namespace)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.3))))
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
    
//    var stare: some View {
        //                    ForEach(modelData.categories.keys.sorted().reversed(), id: \.self) { key in
        //                        CategoryRow(recipes: modelData.categories[key]!, categoryName: key)
        //                            .padding(.bottom, 15)
        //                    }
        
        //                Text("Śniadanie".uppercased())
        //                    .font(.footnote.weight(.semibold))
        //                    .foregroundColor(.secondary)
        //                    .frame(maxWidth: .infinity, alignment: .leading)
        //                    .padding(.horizontal, 20)
        
        
        
        
        
        //                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
        //                    if !show {
        //                        ForEach(modelData.recipes.suffix(3)) { recipe in
        //                            RecipeItem(namespace: namespace, show: $show, recipe: recipe, favorites: favorites)
        //                                .onTapGesture {
        //                                    withAnimation(.openCard) {
        //                                        show.toggle()
        //                                        showStatusBar = false
        //                                    }
        //                                }
        //                        }
        //                    }
        //                }
        //                .padding(.horizontal, 20)
//    }
}
