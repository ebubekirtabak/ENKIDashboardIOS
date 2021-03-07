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
    @State static var cardData = initReportCardData()
        
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: ReportCardView(cardData: DashboardView.$cardData)) {
                    VStack {
                        ReportCardView(cardData: self.parseLinkedinData(responseData: self.responseData))
                        ReportCardView(cardData: self.parseReportsData(responseData: self.responseData))
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
    
    func parseLinkedinData(responseData: ResponseModel) -> Binding<ReportCardDataModel> {
        
        let cardValue = ReportCardDataModel(
            title: "",
            imageUrl: "http://52.116.101.196/static/media/linkedin_logo.c24cde28.png",
            balloonColor: "SecondaryAccentColor",
            currentValue: responseData.weeklyUserStats[0].number,
            waitingValue: responseData.scraperStats.waitingUsers,
            cardValues: StatsDataProvider().getLinkedinValues(
                userStats: responseData.userStats,
                scraperStats: responseData.scraperStats
            )
        )
        
        return Binding(get: {  cardValue  }, set: { _,_ in  DashboardView.$cardData })
    }
    
    func parseReportsData(responseData: ResponseModel) -> Binding<ReportCardDataModel> {
        
        let cardValue = ReportCardDataModel(
            title: "Reports",
            imageUrl: "",
            balloonColor: "AlertColor",
            currentValue: responseData.weeklyReportStats[0].number,
            waitingValue: responseData.reportStats.createdReports,
            cardValues: StatsDataProvider().getReportValues(
                reportStats: responseData.reportStats
            )
        )
        
        return Binding(get: {  cardValue  }, set: { _,_ in  DashboardView.$cardData })
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
