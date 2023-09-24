//
//  AnyTransitionBC.swift
//  SwiftUiAdvanced
//
//  Created by mohammed on 18/09/2023.
//

import SwiftUI

struct RotationViewModifier : ViewModifier {
    let rotation: Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                    y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    
    static var rotating : AnyTransition {
        modifier(active: RotationViewModifier(rotation: 180), identity: RotationViewModifier(rotation: 0))
    }
    
    static func rotating(rotation : Double) -> AnyTransition {
        modifier(active: RotationViewModifier(rotation: 180), identity: RotationViewModifier(rotation: 0))
    }
    
    static var rotatOn : AnyTransition {
        asymmetric(insertion: .rotating, removal: .move(edge: .trailing))
    }
}

struct AnyTransitionBC: View {
    @State private var showRectangle = false
    var body: some View {
        VStack{
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350, alignment: .center)
                    .frame(maxWidth: .infinity , maxHeight: .infinity)
//                    .transition(.move(edge: .leading))
//                    .transition(AnyTransition.scale.animation(.easeInOut))
//                    .transition(.rotating(rotation: 555))
                    .transition(.rotatOn)
            }
            
            Spacer()
            
            Text("Click me")
                .withDefaultButtonFormatting(backgroundColor: .cyan)
                .padding(.horizontal , 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 3)){
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct AnyTransitionBC_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBC()
    }
}
