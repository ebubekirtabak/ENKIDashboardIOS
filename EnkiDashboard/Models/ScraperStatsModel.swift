//
//  ScraperStatsModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 1.01.2021.
//

import Foundation

struct ScraperStatsModel: Codable {
    let waitingUsers: Int32
    let preferentialUsers: Int32
}

var initScraperStatsModel = ScraperStatsModel (
    waitingUsers: 0,
    preferentialUsers: 0
)

func initScraperStatsModelData() -> ScraperStatsModel {
    return ScraperStatsModel(
        waitingUsers: 0,
        preferentialUsers: 0
    )
}

