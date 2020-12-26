//
//  CompanyListView.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 19.11.2020.
//

import SwiftUI
import Foundation

struct CompanyListView: View {
    @Binding var companyList: [CompanyStatsModel]
    
    var body: some View {
        List(self.companyList, id: \.finishedReports) { item in
            HStack() {
                RemoteImage(url: self.getRemoteImageURL(imageName: item.companyName))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                Text(item.companyName)
            }
        }
    }
    
    func getRemoteImageURL(imageName: String) -> String {
        return "http://169.63.92.52:5000/static/company_images/" + self.encodedParams(param: imageName.lowercased()) + ".png"
    }
    
    func encodedParams(param: String) -> String {
        print("Company Name: ", param)
        var allowed = CharacterSet.alphanumerics
        allowed.insert(charactersIn: "-._~") // as per RFC 3986
        let encoded = param.addingPercentEncoding(withAllowedCharacters: allowed) ?? ""
        return String(encoded)
    }
}



struct CompanyListView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyListView(companyList: Binding<[CompanyStatsModel]>(get: { () -> [CompanyStatsModel] in
            [CompanyStatsModel]()
        }, set: { (companyStats: [CompanyStatsModel]) in
            companyStats
        }))
    }
}
