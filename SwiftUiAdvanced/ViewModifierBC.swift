//
//  ViewModifierBC.swift
//  SwiftUiAdvanced
//
//  Created by mohammed on 15/09/2023.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier{
    let backgroundColor : Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(backgroundColor)
            .cornerRadius(12)
            .shadow(radius: 12)
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color) -> some View{
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBC: View {
    var body: some View {
        VStack{
            Text("SwiftUi")
                .withDefaultButtonFormatting(backgroundColor: .red)
                
                
        }
        .padding()

    }
}

struct ViewModifierBC_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBC()
    }
}
