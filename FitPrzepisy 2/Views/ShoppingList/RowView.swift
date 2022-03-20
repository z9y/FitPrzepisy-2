//
//  RowView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 19/03/2022.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var modelData: ModelData
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Button{
                modelData.changeCompletion(item: item)
            } label: {
                Image(systemName: item.isBought ? "checkmark.circle" : "circle")
            }
            
            Text(item.name)
                .font(.callout)
                .strikethrough(item.isBought ? true : false)
            
            Spacer()
        }
        .padding()
        .cornerRadius(15)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(item: ItemModel(id: UUID(), name: "Test", isBought: true))
    }
}
