//
//  SearchView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 22/05/2022.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @State private var showRecipeCover = false
    @State private var selectedIndex = 0
    @Namespace private var namespace
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Bubbles")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 400)
                        .offset(x: -100, y: -200)
                )
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Kurczak, Makaron, Awokado...")) {
                ForEach(suggestions) { suggestion in
                    Button {
                        searchText = suggestion.text
                    } label: {
                        Text(suggestion.text)
                            .searchCompletion(suggestion.text)
                    }
                }
            }
            .navigationTitle("Szukaj przepisu")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button {
                dismiss()
            } label: {
                Text("Anuluj")
            })
            .sheet(isPresented: $showRecipeCover) {
                RecipeView(recipe: modelData.recipes[selectedIndex], show: $showRecipeCover, namespace: namespace)
            }
        }
    }
    
    var content: some View {
        ForEach(Array(modelData.recipes.enumerated()), id: \.offset) { index, recipe in
            if recipe.name.uppercased().contains(searchText.uppercased()) || searchText == "" {
                if index != 0 { Divider() }
                Button {
                    showRecipeCover = true
                    selectedIndex = index
                } label: {
                    HStack(spacing: 12) {
                        Image(recipe.id)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .background(Color("Background"))
                            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        VStack(alignment: .leading, spacing: 4) {
                            Text(recipe.name).bold()
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 4)
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
