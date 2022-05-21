//
//  HevagonView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/05/2022.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
            context.draw(Image("Bubbles"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 40, width: size.width, height: 120))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.green.opacity(0.8), .green.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
