//
//  ShoppingListView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/03/2022.
//

import AlertToast
import CoreData
import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject var viewModel: DataController
    @State private var showingDelete = false
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.items.isEmpty {
                    NoItemView()
                } else {
                    List(viewModel.items) { item in
                        RowView(item: item)
                    }
                }
            }
            .navigationTitle("Lista zakupów")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingDelete = true
                    } label: {
                        Image(systemName: "trash")
                    }
                    .disabled(viewModel.items.isEmpty)
                    .foregroundColor(viewModel.items.isEmpty ? nil : .primary)
                }
            }
            .alert("Usunąć wszystko z listy zakupów?", isPresented: $showingDelete) {
                Button {
                    viewModel.deleteItem()
                    viewModel.showDeleteToast.toggle()
                } label: {
                    Text("Tak")
                }
                
                Button("Nie", role: .cancel, action: {})
            }
        }
        .toast(isPresenting: $viewModel.showDeleteToast) {
            AlertToast(type: .error(.red), title: "Usunięto")
        }
        .navigationViewStyle(.stack)
        .environmentObject(viewModel)
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var viewModel = DataController()
    
    static var previews: some View {
        ShoppingListView()
            .environmentObject(viewModel)
    }
}
