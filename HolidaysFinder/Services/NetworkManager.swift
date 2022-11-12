//
//  NetworkManager.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum RegionLinks: String {
    case russia = "https://date.nager.at/api/v3/PublicHolidays/2022/RU"
    case usa = "https://date.nager.at/api/v3/PublicHolidays/2022/US"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchHolidays(from url: String, completion: @escaping(Result<[Holiday], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                   let holidays = Holiday.getHolidays(from: value)
                    completion(.success(holidays))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    private init() {}
}


