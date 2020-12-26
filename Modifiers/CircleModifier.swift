//
//  CircleModifier.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 8.12.2020.
//

import SwiftUI

struct CircleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .clipShape(Capsule())
            
    }
}

struct CircleModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {}
            .modifier(CircleModifier())
    }
}
