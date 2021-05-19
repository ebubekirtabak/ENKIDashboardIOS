//
//  HttpService.swift
//  EnkiDashboard
//
//  Created by Ebubekir Tabak on 15.11.2020.
//

import Foundation

class HttpService {
    var apiURL: String
    
    init() {
        self.apiURL = "http://169.63.92.54:3001/v1/"
    }
    
    func postRequest() {
        struct Response: Codable {
            let status: String?
            let error: String?
        }
    }
    
    func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let configuration = URLSessionConfiguration.default
            let token =  ProcessInfo.processInfo.environment["API_TOKEN"]
            configuration.httpAdditionalHeaders = ["Authorization": "Bearer " + String(token!)]
            let urlSession = URLSession(configuration: configuration).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
}

