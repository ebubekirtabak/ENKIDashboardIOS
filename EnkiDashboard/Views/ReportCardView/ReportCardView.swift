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
                colorName: .constant(self.cardData.balloonColor),
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
                    ProgressBarView(value: .constant(self.getProcessRate(cardData: self.cardData)))
                }.padding(.all, 10.0)
                CardValuesView(cardValues: Binding(get: { self.cardData.cardValues }, set: { _,_ in self.cardData.cardValues = [] }))
                    .padding(EdgeInsets(.init(top: 0, leading: 10, bottom: 10, trailing: 10)))
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .background(Color.white)
        .modifier(CardModifier())
    }
    
    func divide(a : Int32, b : Int32) -> Float {
      if b == 0 { return 0 }
      return Float(a) / Float(b)
    }
    
    func getProcessRate(cardData: ReportCardDataModel) -> Float {
        var diff: Int32
        var percent: Float
        if (cardData.currentValue > cardData.waitingValue) {
            diff = cardData.currentValue - cardData.waitingValue
            percent = 100 * self.divide(a: diff, b: cardData.currentValue)
            return percent
        }
        
        diff = cardData.waitingValue - cardData.currentValue;
        percent = self.divide(a: diff, b: cardData.waitingValue)
        return 1.0 - percent
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
            title: "Done", iconName: "", backgroundColorName: "", cardValue:  159756
        )
    ]
    
    @State static var cardData = ReportCardDataModel(
        title: "",
        imageUrl: "http://52.116.101.196/static/media/linkedin_logo.c24cde28.png",
        balloonColor: "SecondaryAccentColor",
        currentValue: 126,
        waitingValue: 1342,
        cardValues: cardValues
    )
    
    @State static var googleCardData = ReportCardDataModel(
        title: "",
        imageUrl: "http://169.63.92.52:5000/static/company_images/google.png",
        balloonColor: "AlertColor",
        currentValue: 1066,
        waitingValue: 1342,
        cardValues: cardValues
    )
    static var previews: some View {
        ReportCardView(cardData: $cardData)
        ReportCardView(cardData: $googleCardData)
    }
}
