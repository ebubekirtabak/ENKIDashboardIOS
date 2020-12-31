//
//  CardValuesView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 10.12.2020.
//

import SwiftUI

struct CardValuesView: View {
    @Binding var cardValues: [CardValuesModel]
    
    var body: some View {
        LazyVGrid (columns: [
            GridItem(.adaptive(minimum: 70)),
            GridItem(.adaptive(minimum: 70))
        ], content: {
            CardValueView(cardValue: self.$cardValues[0])
            CardValueView(cardValue: self.$cardValues[1])
            CardValueView(cardValue: self.$cardValues[2])
            CardValueView(cardValue: self.$cardValues[3])
        })
        .frame(maxWidth: .infinity)
    }
}

struct CardValuesView_Previews: PreviewProvider {
    @State static var cardValues: [CardValuesModel] = [
        CardValuesModel(
            title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: 211961
        ),
        CardValuesModel(
            title: "Waiting", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: 578
        ),
        CardValuesModel(
            title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: 0
        ),
        CardValuesModel(
            title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: 159756
        )
    ]
    
    static var previews: some View {
        CardValuesView(cardValues: $cardValues)
    }
}
