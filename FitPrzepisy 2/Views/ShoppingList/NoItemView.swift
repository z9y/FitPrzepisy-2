//
//  NoItemView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 19/03/2022.
//

import SwiftUI

struct NoItemView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Nie masz nic w swojej liście zakupów. \(Image(systemName: "cart"))")
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemView()
    }
}
