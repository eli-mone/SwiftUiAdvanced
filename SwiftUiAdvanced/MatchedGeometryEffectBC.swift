//
//  MatchedGeometryEffectBC.swift
//  SwiftUiAdvanced
//
//  Created by mohammed on 20/09/2023.
//

import SwiftUI

struct MatchedGeometryEffectBC: View {
    
    @State private var isClicked = false
    @Namespace private var nameSpace
    
    var body: some View {
        VStack{
            if !isClicked{
                RoundedRectangle(cornerRadius: 12)
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 100, height: 100)

            }
            
            Spacer()
            
            if isClicked {
//                RoundedRectangle(cornerRadius: 12)
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 200, height: 200)

            }
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(.cyan)
        .onTapGesture {
            withAnimation(.easeInOut){
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectBC_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect2()
    }
}

struct MatchedGeometryEffect2 : View{
    
    let categories: [String] = ["Home", "Popular", "Saved" ]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach (categories, id: \.self) { category in
                ZStack {
                    if selected == category {
                        RoundedRectangle (cornerRadius: 10)
                            .fill (Color.red.opacity (0.5))
                            .matchedGeometryEffect(id: "category_back", in: namespace2)
                    }
                    Text(category)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()){
                        selected = category
                    }
                }
            }
        }
    }
}
