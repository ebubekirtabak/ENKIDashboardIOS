//
//  ContentView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 3.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State var companyList: [CompanyStatsModel] = []
    @State var responseData: ResponseModel = initResponseModel()
    let apiURL = "http://169.63.92.54:3001/v1/stats/all"
    var body: some View {
        TabView {
            DashboardView(responseData: self.$responseData).tabItem {
                Image(systemName: "gauge")
                Text("Dashboard")
            }.background(Color("Background"))
            CompanyListView(companyList: self.$companyList).tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Top Companies")
            }
            DashboardView(responseData: self.$responseData).tabItem {
                Image(systemName: "exclamationmark.bubble")
                Text("Notifications")
            }
            DashboardView(responseData: self.$responseData).tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }.onAppear {
            print("Send Request: ", self.apiURL)
            HttpService().loadJson(fromURLString: self.apiURL) { (result) in
                switch result {
                case .success(let data):
                    self.parse(jsonData: data)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(BaseResponseModel.self,
                                                       from: jsonData)
            self.responseData = decodedData.response
            self.companyList = responseData.companyStats
            
            print("Status: ", decodedData.message)
        } catch {
            print("decode error: \(error).")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
