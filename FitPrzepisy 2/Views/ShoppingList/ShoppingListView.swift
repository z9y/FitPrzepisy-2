//
//  ShoppingListView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/03/2022.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingDelete = false
    
    var body: some View {
        NavigationView {
            VStack {
                if modelData.items.isEmpty {
                    NoItemView()
                } else {
                    List(modelData.items) { item in
                        RowView(item: item)
                    }
                }
            }
            .navigationTitle("List zakupów")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingDelete = true
                    } label: {
                        Image(systemName: "trash")
                    }
                    .disabled(modelData.items.isEmpty)
                }
            }
            .alert("Usunąć wszystko z listy zakupów?", isPresented: $showingDelete) {
                Button {
                    modelData.items.removeAll()
                } label: {
                    Text("Tak")
                }
                
                Button("Nie", role: .cancel, action: {})
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
            .environmentObject(ModelData())
    }
}
