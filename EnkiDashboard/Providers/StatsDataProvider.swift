//
//  StatsDataProviders.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 24.12.2020.
//

import Foundation


class StatsDataProvider {
    
    init() {
       
    }
    
    func getLinkedinValues(userStats: UserStatsModel, scraperStats: ScraperStatsModel) -> [CardValuesModel] {
        return  [
            CardValuesModel(
                title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: userStats.ready_users
            ),
            CardValuesModel(
                title: "Waiting", iconName: "hourglass.tophalf.fill", backgroundColorName: "SecondaryColor", cardValue: scraperStats.waitingUsers
            ),
            CardValuesModel(
                title: "Preferential", iconName: "arrow.up", backgroundColorName: "AlertColor", cardValue: scraperStats.preferentialUsers
            ),
            CardValuesModel(
                title: "Saved", iconName: "folder.fill", backgroundColorName: "SecondaryAccentColor", cardValue: userStats.saved_users
            )
        ]
    }
    
    func getReportValues(reportStats: ReportStatsModel) -> [CardValuesModel] {
        return  [
            CardValuesModel(
                title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: (reportStats.topReports - reportStats.createdReports)
            ),
            CardValuesModel(
                title: "Waiting", iconName: "hourglass.tophalf.fill", backgroundColorName: "SecondaryColor", cardValue: reportStats.createdReports
            ),
            CardValuesModel(
                title: "Preferential", iconName: "arrow.up",  backgroundColorName: "SecondaryAccentColor", cardValue: reportStats.preferentialReports
            ),
            CardValuesModel(
                title: "Canceled", iconName: "xmark.circle",backgroundColorName: "AlertColor", cardValue: reportStats.canceledReports
            )
        ]
    }
    
    func getSearchValues(searchStats: GoogleStatsModel) -> [CardValuesModel] {
        return  [
            CardValuesModel(
                title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: (searchStats.topSearch - searchStats.createdSearch)
            ),
            CardValuesModel(
                title: "Waiting", iconName: "hourglass.tophalf.fill", backgroundColorName: "SecondaryColor", cardValue: searchStats.createdSearch
            ),
            CardValuesModel(
                title: "Preferential", iconName: "arrow.up",  backgroundColorName: "SecondaryAccentColor", cardValue: searchStats.preferentialSearch
            ),
            CardValuesModel(
                title: "Canceled", iconName: "xmark.circle",backgroundColorName: "AlertColor", cardValue: searchStats.canceledSearch
            )
        ]
    }

}
