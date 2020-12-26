//
//  CardModifier.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 1.12.2020.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
            .padding(.leading, 10)
            .padding(.bottom, 5)
            .padding(.top, 0)
            .padding(.trailing, 10)
    }
}

struct CardModifier_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .leading) {
            VStack {
                Text("Hello World")
            }.modifier(CardModifier())
        }.padding(.all, 10.0)
    }
}
