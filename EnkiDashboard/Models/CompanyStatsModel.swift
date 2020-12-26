//
//  CompanyStatsModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 21.11.2020.
//

import Foundation

struct CompanyStatsModel {
    let companyName: String
    let finishedReports: Int32
    let waitingReports: Int32
    let topReports: Int32
}

extension CompanyStatsModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case finishedReports = "finished_reports"
        case waitingReports = "waiting_reports"
        case topReports = "top_reports"
    }
}

func initCompanyStats() -> CompanyStatsModel {
    return CompanyStatsModel(
        companyName: "",
        finishedReports: 0,
        waitingReports: 0,
        topReports: 0
    )
}
