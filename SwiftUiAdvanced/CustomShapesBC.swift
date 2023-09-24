//
//  CustomShapesBC.swift
//  SwiftUiAdvanced
//
//  Created by mohammed on 24/09/2023.
//

import SwiftUI

struct Triangle : Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
    
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontal0ffset = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine (to: CGPoint (x: rect.maxX - horizontal0ffset, y: rect.midY))
            path.addLine (to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine (to: CGPoint (x: rect.minX + horizontal0ffset, y: rect.midY))
            path.addLine (to: CGPoint (x: rect.midX, y: rect.minY))
        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontal0ffset = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontal0ffset, y: rect.minY))
            path.addLine (to: CGPoint (x: rect.maxX - horizontal0ffset, y: rect.minY))
            path.addLine (to: CGPoint (x: rect.maxX, y: rect.maxY))
            path.addLine (to: CGPoint (x: rect.minX, y: rect.maxY))
            path.addLine (to: CGPoint (x: rect.minX + horizontal0ffset, y: rect.minY))
        }
    }
}

struct CustomShapesBC: View {
    var body: some View {
        ZStack{
//            Triangle()
//                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [12]))
//                .foregroundColor(.cyan)
//            Diamond()
            Trapezoid()
                .frame(width: 300, height: 150)
        }
    }
}

struct CustomShapesBC_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesBC()
    }
}
