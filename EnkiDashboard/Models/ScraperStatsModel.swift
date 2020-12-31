//
//  ScraperStatsModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 1.01.2021.
//

import Foundation

struct ScraperStatsModel {
    let waitingUsers: Int32
    let preferentialUsers: Int32
}

extension ScraperStatsModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case waitingUsers = "waiting_users"
        case preferentialUsers = "preferential_users"
    }
}

func initScraperStatsModelData() -> ScraperStatsModel {
    return ScraperStatsModel(
        waitingUsers: 0,
        preferentialUsers: 0
    )
}

