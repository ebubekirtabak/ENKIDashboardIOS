//
//  CircleView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 8.12.2020.
//

import SwiftUI

struct CircleView: View {
    @Binding var colorName: String
    @Binding var colorOpacity: Double
    
    var body: some View {
        GeometryReader { geometry in
            var width: CGFloat = min(geometry.size.width, geometry.size.height)
            Circle()
                .foregroundColor(Color(self.colorName))
                .frame(width: geometry.size.width * 2)
                .opacity(self.colorOpacity)
                .offset(x: geometry.size.width * -0.12 , y: geometry.size.height * -0.47)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    @State static var colorName = "SecondaryAccentColor"
    @State static var colorOpacity = 0.7
    static var previews: some View {
        CircleView(colorName: $colorName, colorOpacity: $colorOpacity)
    }
}
