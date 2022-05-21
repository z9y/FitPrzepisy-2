//
//  Styles.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/05/2022.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(.linearGradient(
                    colors: [
                        .white.opacity(colorScheme == .dark ? 0.1 : 0.3),
                        .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom)
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
