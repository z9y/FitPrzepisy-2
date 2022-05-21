//
//  PreferenceKeys.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 15/05/2022.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
