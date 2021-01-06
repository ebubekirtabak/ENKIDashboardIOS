//
//  LinkedinView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 28.11.2020.
//

import SwiftUI

struct ReportCardView: View {
    @Binding var cardData: ReportCardDataModel

    var body: some View {
        ZStack(alignment: .leading) {
            CircleViewBackground(
                colorName: .constant("SecondaryAccentColor"),
                colorOpacity: .constant(0.7)
            )
            VStack(alignment: .leading) {
                
                HStack(alignment: .center) {
                    if self.cardData.imageUrl.count > 0  {
                        RemoteImage(url: self.cardData.imageUrl).aspectRatio(contentMode: .fit).frame(width: 75)
                    }
                    
                    Text(self.cardData.title)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("PrimaryDarkColor"))
                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                
                
                VStack(alignment: .leading) {
                    Text("Today")
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryDarkColor"))
                        .lineLimit(2)
                        .padding(.bottom, 1.0)
      
                    
                    Text(String(self.cardData.currentValue))
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("PrimaryDarkColor"))
                    ProgressBarView(value: .constant(0.37))
                }.padding(.all, 10.0)
                CardValuesView(cardValues: Binding(get: { self.cardData.cardValues }, set: { _,_ in self.cardData.cardValues = [] }))
                    .padding(EdgeInsets(.init(top: 0, leading: 10, bottom: 10, trailing: 10)))
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .background(Color.white)
        .modifier(CardModifier())
    }
}

struct ReportCardView_Previews: PreviewProvider {
    @State static var cardValues: [CardValuesModel] = [
        CardValuesModel(
            title: "Done", iconName: "", backgroundColorName: "", cardValue: 211961
        ),
        CardValuesModel(
            title: "Done", iconName: "", backgroundColorName: "", cardValue: 578
        ),
        CardValuesModel(
            title: "Done", iconName: "", backgroundColorName: "", cardValue: 0
        ),
        CardValuesModel(
            title: "Done", iconName: "", backgroundColorName: "", cardValue: 159756
        )
    ]
    
    @State static var cardData = ReportCardDataModel(
        imageUrl: "http://52.116.101.196/static/media/linkedin_logo.c24cde28.png",
        currentValue: 2756,
        cardValues: cardValues
    )
    
    @State static var googleCardData = ReportCardDataModel(
        imageUrl: "http://169.63.92.52:5000/static/company_images/google.png",
        currentValue: 1066,
        cardValues: cardValues
    )
    static var previews: some View {
        ReportCardView(cardData: $cardData)
        ReportCardView(cardData: $googleCardData)
    }
}
