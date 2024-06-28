//
//  ButtonView.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 20/06/24.
//

import SwiftUI

struct ButtonView: View {
    var buttonText : String = "Test"
    var height : CGFloat = 30
    var width : CGFloat = 100
    var backColor : Color = .black
    var body: some View {
        Text(buttonText)
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
            .frame(width: width , height: height)
            .background(backColor)
            .clipShape(RoundedRectangle(cornerRadius: (width/height)*10))
            .foregroundStyle(Color.white)
            .shadow(color: Color.gray, radius: 7, x: -10, y: -5)
            
        
        
    }
}

#Preview {
    ButtonView()
}
