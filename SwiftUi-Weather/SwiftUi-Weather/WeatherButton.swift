//
//  WeatherButton.swift
//  SwiftUi-Weather
//
//  Created by Farhana Azman on 21/04/2021.
//

import SwiftUI

struct ChangeButton: View {
    
    var titleBtn: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(titleBtn)
            .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
