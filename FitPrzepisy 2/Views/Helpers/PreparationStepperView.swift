//
//  PreparationStepperView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 12/05/2022.
//

import StepperView
import SwiftUI

struct PreparationStepperView: View {
    var preparation: [String]
    
    var steps = [ Text("Cart").font(.caption),
                  Text("Delivery Address").font(.caption),
                  Text("Order Summary").font(.caption),
                  Text("Payment Method").font(.caption),
                  Text("Track").font(.caption)]

    var indicationTypes = [StepperIndicationType.custom(NumberedCircleView(text: "1")),
                            .custom(NumberedCircleView(text: "2")),
                            .custom(NumberedCircleView(text: "3")),
                            .custom(NumberedCircleView(text: "4")),
                            .custom(NumberedCircleView(text: "5"))]
    
    var body: some View {
        
        StepperView()
            .addSteps(steps)
            .indicators(indicationTypes)
            .stepIndicatorMode(StepperMode.vertical)
            .spacing(30)
            .lineOptions(StepperLineOptions.custom(1, Colors.blue(.teal).rawValue))
    }
}

struct PreparationStepperView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationStepperView(preparation: [])
    }
}
