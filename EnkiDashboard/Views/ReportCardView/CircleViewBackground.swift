//
//  CircleView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 8.12.2020.
//

import SwiftUI

struct CircleViewBackground: View {
    @Binding var colorName: String
    @Binding var colorOpacity: Double
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width;
            Circle()
                .foregroundColor(Color(self.colorName))
                .frame(width: width * 2)
                .opacity(self.colorOpacity)
                .offset(x: geometry.size.width * -0.12 , y: geometry.size.height * -0.47)
        }
    }
}

struct CircleViewBackground_Previews: PreviewProvider {
    @State static var colorName = "SecondaryAccentColor"
    @State static var colorOpacity = 0.7
    static var previews: some View {
        CircleViewBackground(colorName: $colorName, colorOpacity: $colorOpacity)
    }
}
