//
//  VerticalAlignment-Extension.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 23/03/2022.
//

import Foundation
import SwiftUI


//MOZNA SKASOWAC 
extension VerticalAlignment {
    enum MidRecipeDetails: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midRecipeDetails = VerticalAlignment(MidRecipeDetails.self)
}
