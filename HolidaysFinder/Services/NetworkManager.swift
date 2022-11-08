//
//  NetworkManager.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

import Foundation

enum NetworkErrors: Error {
    
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private func fetchHolidays() {
        guard let url = URL(string: "https://date.nager.at/api/v3/PublicHolidays/2022/RU") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let holidays = try decoder.decode([Holidays].self, from: data)
                print(holidays)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    private init() {}
}
