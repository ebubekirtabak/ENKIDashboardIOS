//
//  ReportCardDataModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 12.12.2020.
//

import Foundation

struct ReportCardDataModel: Codable {
    let title: String
    var imageUrl: String
    let balloonColor: String
    let currentValue: Int32
    let waitingValue: Int32
    var cardValues: [CardValuesModel];
}


func initReportCardData() -> ReportCardDataModel {
    return ReportCardDataModel(
        title: "Scrapers",
        imageUrl: "https://www.selenium.dev/images/selenium_logo_large.png",
        balloonColor: "AccentGreen",
        currentValue: 126,
        waitingValue: 1342,
        cardValues: [
            CardValuesModel(
                title: "Done", iconName: "checkmark", backgroundColorName: "SecondaryAccentColor", cardValue: 211961
            ),
            CardValuesModel(
                title: "Waiting", iconName: "hourglass.tophalf.fill", backgroundColorName: "SecondaryColor", cardValue: 578
            ),
            CardValuesModel(
                title: "Preferential", iconName: "arrow.up", backgroundColorName: "AlertColor", cardValue: 0
            ),
            CardValuesModel(
                title: "Saved", iconName: "folder.fill", backgroundColorName: "SecondaryAccentColor", cardValue: 159756
            )
        ]
    )
}
