//
//  ReportCardDataModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 12.12.2020.
//

import Foundation

struct ReportCardDataModel: Codable {
    var imageUrl: String
    let currentValue: Int32
    var cardValues: [CardValuesModel];
}
