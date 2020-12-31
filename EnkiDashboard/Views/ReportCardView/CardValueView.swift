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
            Text(self.cardValue.title)
                .font(.system(size: 10))
                .foregroundColor(Color(self.cardValue.backgroundColorName))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            HStack {
                Circle()
                    .overlay(
                        Image(systemName: self.cardValue.iconName).foregroundColor(.white)
                            .font(.system(size: 10, weight: .light))
                    )
                    .frame(width: 18.0, height: 18.0)
                    .foregroundColor(Color(self.cardValue.backgroundColorName))
                
                Text(self.formatNumber(number: self.cardValue.cardValue))
                    .font(.system(size: 10))
                    .foregroundColor(Color("PrimaryDarkColor"))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
    
    func formatNumber(number: Int32) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumSignificantDigits = 1
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: number))!
    }
}

struct CardValueView_Previews: PreviewProvider {
    @State static var cardValue: CardValuesModel = CardValuesModel(
        title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: 211961
    )
    
    static var previews: some View {
        CardValueView(cardValue: $cardValue)
    }
}
