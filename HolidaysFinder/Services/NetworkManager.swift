//
//  NetworkManager.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

import Foundation

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
    
    func fetchHolidays(from url: String, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let holidays = try JSONDecoder().decode([Holidays].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
                print(holidays)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    private init() {}
}
