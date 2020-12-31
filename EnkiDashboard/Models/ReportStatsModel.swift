//
//  ReportStatsModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 1.01.2021.
//

import Foundation

struct ReportStatsModel {
    let readyReports: Int32
    let createdReports: Int32
    let preferentialReports: Int32
    let canceledReports: Int32
    let topReports: Int32
}

extension ReportStatsModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case readyReports = "ready_reports"
        case createdReports = "created_reports"
        case preferentialReports = "preferential_reports"
        case canceledReports = "canceled_reports"
        case topReports = "top_reports"
    }
}

func initReportStatsModelData() -> ReportStatsModel {
    return ReportStatsModel(
        readyReports: 0
        createdReports: 0
        preferentialReports: 0
        canceledReports: 0
        topReports: 0
    )
}

