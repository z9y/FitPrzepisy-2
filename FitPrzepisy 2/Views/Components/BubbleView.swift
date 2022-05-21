//
//  BubbleView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/05/2022.
//

import SwiftUI

struct BubbleView: View {
    @State private var appear = false
    
    var body: some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 60)
            let x = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 10)
            let x2 = cos(angle2.radians)
//            Text("Value:\(x)")
            
            Canvas { context, size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, x2: x2), with: .linearGradient(Gradient(colors: [.green.opacity(0.9), .green.opacity(0.2)]), startPoint: CGPoint(x: 50, y: 2), endPoint: CGPoint(x: 100, y: 400)))
            }
            .frame(width: 400, height: 414)
            .rotationEffect(.degrees(appear ? 360 : 0))
        }
        .onAppear {
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: true)) {
                appear = true
            }
        }
    }
    
    func path(in rect: CGRect, x: Double, x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.93031*width, y: 0.29973*height))
        path.addCurve(to: CGPoint(x: 0.52439*width*x2, y: 0.99731*height), control1: CGPoint(x: 0.88501*width, y: 0.5457*height), control2: CGPoint(x: 1.2892*width*x2, y: 1.02419*height*x2))
        path.addCurve(to: CGPoint(x: 0.1324*width*x2, y: 0.44489*height*x2), control1: CGPoint(x: 0.3203*width*x, y: 0.97917*height*x2), control2: CGPoint(x: 0.40069*width*x2, y: 0.71909*height*x2))
        path.addCurve(to: CGPoint(x: 0.39373*width*x2, y: 0), control1: CGPoint(x: -0.10696*width*x2, y: 0.20027*height*x), control2: CGPoint(x: -0.01519*width*x, y: 0))
        path.addCurve(to: CGPoint(x: 0.93031*width, y: 0.29973*height*x2), control1: CGPoint(x: 0.84146*width*x2, y: 0), control2: CGPoint(x: 0.93031*width, y: 0.06813*height))
        path.closeSubpath()
        return path
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView()
    }
}



struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99619*width, y: 0.27857*height))
        path.addCurve(to: CGPoint(x: 0.48479*width, y: height), control1: CGPoint(x: 0.94676*width, y: 0.54*height), control2: CGPoint(x: 1.18631*width, y: 0.74143*height))
        path.addCurve(to: CGPoint(x: 0.12547*width, y: 0.43286*height), control1: CGPoint(x: 0.26207*width, y: 0.98072*height), control2: CGPoint(x: 0.41825*width, y: 0.72429*height))
        path.addCurve(to: CGPoint(x: 0.48479*width, y: 0), control1: CGPoint(x: -0.13573*width, y: 0.17286*height), control2: CGPoint(x: 0.03855*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.99619*width, y: 0.27857*height), control1: CGPoint(x: 0.93103*width, y: 0), control2: CGPoint(x: 0.99619*width, y: 0.03241*height))
        path.closeSubpath()
        return path
    }
}
