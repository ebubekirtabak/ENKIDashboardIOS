//
//  ProgressBarView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 1.12.2020.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var value: Float
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color("SecondaryColor"))
                    .opacity(1)
                    .frame(width: geometry.size.width , height: 10)
                    .cornerRadius(4.0)
                Rectangle()
                    .foregroundColor(Color("AccentGreen"))
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: 10)
                    .animation(.linear)
                    .cornerRadius(4.0)
            }
            .cornerRadius(4.0)
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    @State static var progress: Float = 0.25
    static var previews: some View {
        ProgressBarView(value: $progress)
    }
    
}
