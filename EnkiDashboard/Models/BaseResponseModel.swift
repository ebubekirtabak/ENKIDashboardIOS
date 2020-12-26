//
//  BaseResponseModel.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 21.11.2020.
//

import Foundation

struct BaseResponseModel {
    let result: Int32
    let message: String
    let errorMessage: String
    let response: ResponseModel
}

extension BaseResponseModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case message = "message"
        case errorMessage = "error_message"
        case response = "response"
    }
}
