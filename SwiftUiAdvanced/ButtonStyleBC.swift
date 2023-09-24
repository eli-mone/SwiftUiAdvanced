//
//  ButtonStyleBC.swift
//  SwiftUiAdvanced
//
//  Created by mohammed on 15/09/2023.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let sacaleAmount: CGFloat
    
    init(sacaleAmount: CGFloat) {
        self.sacaleAmount = sacaleAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? sacaleAmount : 1)
            .opacity(configuration.isPressed ? 0.8 : 1)
//            .brightness(configuration.isPressed ? 0.08 : 0)
    }
}

extension View {
    func withPressableStyle(scaleAmount : CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(sacaleAmount: scaleAmount))
    }
}

struct ButtonStyleBC: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .cyan)
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity)
//                .frame(height: 50)
//                .background(.cyan)
//                .cornerRadius(12)
//                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
                
            
        }
//        .buttonStyle(PressableButtonStyle(sacaleAmount: 0.7))
        .withPressableStyle()
        .padding(40)

    }
}

struct ButtonStyleBC_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBC()
    }
}
