//
//  UserStatsModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 21.11.2020.
//

import Foundation

struct UserStatsModel: Codable {
    let ready_users: Int32
    let draft_users: Int32
    let top_users: Int32
    let saved_users: Int32
}
