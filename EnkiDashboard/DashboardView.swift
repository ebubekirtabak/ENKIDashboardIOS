//
//  DashboardView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 19.11.2020.
//

import SwiftUI

struct DashboardView: View {
    let apiURL = "http://169.63.92.54:3001/v1/stats/all"
    @Binding var responseData: ResponseModel
    @State static var cardData = ReportCardDataModel(
        imageUrl: "http://52.116.101.196/static/media/linkedin_logo.c24cde28.png",
        currentValue: 2756,
        cardValues: [
            CardValuesModel(
                title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: 211961
            ),
            CardValuesModel(
                title: "Waiting", iconName: "hourglass.tophalf.fill", backgroundColorName: "SecondaryColor", cardValue: 578
            ),
            CardValuesModel(
                title: "Preferential", iconName: "arrow.up", backgroundColorName: "AlertColor", cardValue: 0
            ),
            CardValuesModel(
                title: "Saved", iconName: "folder.fill", backgroundColorName: "SecondaryAccentColor", cardValue: 159756
            )
        ]
    )
        
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: ReportCardView(cardData: DashboardView.$cardData)) {
                    VStack {
                        ReportCardView(cardData:
                                        Binding(get: {   self.parseLinkedinData(
                                            responseData: self.responseData
                                        ) }, set: { _,_ in  DashboardView.$cardData })
                                      )
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
//        .onAppear {
//            self.parseLinkedinData(
//                responseData: self.responseData
//            )
//        }
    }
    
    func parseLinkedinData(responseData: ResponseModel) -> ReportCardDataModel {
        
        var cardValue = ReportCardDataModel(
            imageUrl: "http://52.116.101.196/static/media/linkedin_logo.c24cde28.png",
            currentValue: responseData.weeklyUserStats[0].number,
            cardValues: StatsDataProvider().getLinkedinValues(
                userStats: responseData.userStats,
                scraperStats: responseData.scraperStats
            )
        )
        return cardValue
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    @State static var responseModel = initResponseModel()
    static var previews: some View {
        Group {
            DashboardView(responseData: $responseModel)
        }
    }
}
