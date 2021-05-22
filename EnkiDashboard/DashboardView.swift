//
//  DashboardView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 19.11.2020.
//

import SwiftUI

struct DashboardView: View {
    let apiURL = "http://52.117.59.162:3001/v1/stats/all"
    @Binding var responseData: ResponseModel
    @State static var cardData = initReportCardData()
        
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: ReportCardView(cardData: DashboardView.$cardData)) {
                    VStack {
                        ReportCardView(cardData: self.parseLinkedinData(responseData: self.responseData))
                        ReportCardView(cardData: self.parseReportsData(responseData: self.responseData))
                        ReportCardView(cardData: self.parseSearchData(responseData: self.responseData))
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
            imageUrl: "http://52.117.59.172/static/media/linkedin_logo.c24cde28.png",
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
    
    func parseSearchData(responseData: ResponseModel) -> Binding<ReportCardDataModel> {
        
        let cardValue = ReportCardDataModel(
            title: "Search",
            imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/440px-Google_2015_logo.svg.png",
            balloonColor: "AccentGreen",
            currentValue: responseData.weeklyGoogleCacheStats[0].number,
            waitingValue: responseData.googleStats.createdSearch,
            cardValues: StatsDataProvider().getSearchValues(
                searchStats: responseData.googleStats
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
