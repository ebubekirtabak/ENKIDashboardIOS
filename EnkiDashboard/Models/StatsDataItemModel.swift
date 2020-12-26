//
//  StatsDataItemModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 24.12.2020.
//

import Foundation

struct StatsDataItemModel {
    let date: String
    let time: Int32
    let number: Int32
}

extension StatsDataItemModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case time = "time"
        case number = "number"
    }
}

func initStatsDataItemModel() -> StatsDataItemModel {
    return StatsDataItemModel(date: "", time: 0, number: 0)
}
