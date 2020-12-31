//
//  ResponseModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 21.11.2020.
//

import Foundation

struct ResponseModel {
    let userStats: UserStatsModel
    let scraperStats: ScraperStatsModel
    let companyStats: [CompanyStatsModel]
    let weeklyUserStats: [StatsDataItemModel]
    let weeklyReportStats: [StatsDataItemModel]
    let weeklyGoogleCacheStats: [StatsDataItemModel]
}

extension ResponseModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case companyStats = "company_stats"
        case userStats = "user_stats"
        case scraperStats = "scraper_stats"
        case weeklyUserStats = "weekly_user_stats"
        case weeklyReportStats = "weekly_report_stats"
        case weeklyGoogleCacheStats = "weekly_google_cache_stats"
    }
}

func initResponseModel() -> ResponseModel {
    return ResponseModel(
        userStats: initStatsModelData(),
        scraperStats: initScraperStatsModelData()
        companyStats: [initCompanyStats()],
        weeklyUserStats: [initStatsDataItemModel()],
        weeklyReportStats: [initStatsDataItemModel()],
        weeklyGoogleCacheStats: [initStatsDataItemModel()]
    )
}
