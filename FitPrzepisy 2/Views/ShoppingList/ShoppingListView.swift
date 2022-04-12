//
//  ShoppingListView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/03/2022.
//

import CoreData
import SwiftUI

struct ShoppingListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.isBought),
        SortDescriptor(\.name)
    ]) var items: FetchedResults<Item>
    
    @EnvironmentObject var modelData: ModelData
    @State private var showingDelete = false
    
    var body: some View {
        NavigationView {
            VStack {
                if items.isEmpty {
                    NoItemView()
                } else {
                    List(items) { item in
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
                    .disabled(items.isEmpty)
                }
            }
            .alert("Usunąć wszystko z listy zakupów?", isPresented: $showingDelete) {
                Button {
                    deleteItem()
                } label: {
                    Text("Tak")
                }
                
                Button("Nie", role: .cancel, action: {})
            }
        }
        .navigationViewStyle(.stack)
    }
    
    func deleteItem() {
        for item in items {
            moc.delete(item)
        }
        
        try? moc.save()
    }
    
    func changeBool(item: Item) {
        item.isBought = !item.isBought
        
        try? moc.save()
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
            .environmentObject(ModelData())
    }
}
