//
//  ResponseModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 21.11.2020.
//

import Foundation

struct ResponseModel {
    let userStats: UserStatsModel
    let companyStats: [CompanyStatsModel]
}

extension ResponseModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case companyStats = "company_stats"
        case userStats = "user_stats"
    }
}
