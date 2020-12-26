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
    
    func getLinkedinValues(userStats: UserStatsModel) -> [CardValuesModel] {
        return  [
            CardValuesModel(
                title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: String(format: "%02d", userStats.ready_users)
            ),
            CardValuesModel(
                title: "Waiting", iconName: "hourglass.tophalf.fill", backgroundColorName: "SecondaryColor", cardValue: String(format: "%02d", userStats.draft_users)
            ),
            CardValuesModel(
                title: "Preferential", iconName: "arrow.up", backgroundColorName: "AlertColor", cardValue: "0"
            ),
            CardValuesModel(
                title: "Saved", iconName: "folder.fill", backgroundColorName: "SecondaryAccentColor", cardValue: String(format: "%02d", userStats.saved_users)
            )
        ]
    }
}
