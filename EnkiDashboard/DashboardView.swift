//
//  DashboardView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 19.11.2020.
//

import SwiftUI

struct DashboardView: View {
    let apiURL = "http://169.63.92.54:3001/v1/stats/all"
    
    @State static var cardData = ReportCardDataModel(
        imageUrl: "http://52.116.101.196/static/media/linkedin_logo.c24cde28.png",
        currentValue: 2756,
        cardValues: [
            CardValuesModel(
                iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: "211,961"
            ),
            CardValuesModel(
                iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: "578"
            ),
            CardValuesModel(
                iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: "0"
            ),
            CardValuesModel(
                iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: "159,756"
            )
        ]
    )
        
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: ReportCardView(cardData: DashboardView.$cardData)) {
                    VStack {
                        ReportCardView(cardData: DashboardView.$cardData)
                        ReportCardView(cardData: DashboardView.$cardData)
                        ReportCardView(cardData: DashboardView.$cardData)
                    }
                }
                .navigationBarTitle("Dashboard")
                .navigationBarItems(trailing:
                    Button(action: {
                        print("Edit button pressed...")
                    }) {
                        Text("Edit")
                    }
                )
     
            }
            

        }.background(Color("Background"))
    }
    
}

struct DashboardView_Previews: PreviewProvider {
  
    
    static var previews: some View {
        Group {
            DashboardView()
        }
    }
}
