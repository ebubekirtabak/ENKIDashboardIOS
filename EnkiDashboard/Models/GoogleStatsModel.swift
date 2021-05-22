//
//  GoogleStatsModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 23.05.2021.
//

import Foundation

struct GoogleStatsModel {
    let readySearch: Int32
    let createdSearch: Int32
    let preferentialSearch: Int32
    let canceledSearch: Int32
    let topSearch: Int32
}

extension GoogleStatsModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case readySearch = "ready_search"
        case createdSearch = "created_search"
        case preferentialSearch = "preferential_search"
        case canceledSearch = "canceled_search"
        case topSearch = "top_search"
    }
}

func initGoogleStatsModelData() -> GoogleStatsModel {
    return GoogleStatsModel (
        readySearch: 0,
        createdSearch: 0,
        preferentialSearch: 0,
        canceledSearch: 0,
        topSearch: 0
    )
}

