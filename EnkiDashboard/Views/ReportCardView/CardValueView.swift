//
//  CardValueView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 8.12.2020.
//

import SwiftUI

struct CardValueView: View {
    @Binding var cardValue: CardValuesModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Done")
                .font(.system(size: 10))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            HStack {
                Circle()
                    .overlay(
                        Image(systemName: self.cardValue.iconName).foregroundColor(.white)
                            .font(.system(size: 10, weight: .light))
                    )
                    .frame(width: 18.0, height: 18.0)
                    .foregroundColor(Color(self.cardValue.backgroundColorName))
                
                Text(self.cardValue.cardValue)
                    .font(.system(size: 10))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}

struct CardValueView_Previews: PreviewProvider {
    @State static var cardValue: CardValuesModel = CardValuesModel(
        iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: "211,961"
    )
    
    static var previews: some View {
        CardValueView(cardValue: $cardValue)
    }
}
