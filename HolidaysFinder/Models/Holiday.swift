//
//  Holidays.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

struct Holiday: Decodable {
    let name: String
    let localName: String
    let date: String
    
    init(name: String, localName: String, date: String) {
        self.name = name
        self.localName = localName
        self.date = date
    }
    
    init(holiday: [String: Any]) {
        name = holiday["name"] as? String ?? ""
        localName = holiday["localName"] as? String ?? ""
        date = holiday["date"] as? String ?? ""
    }
    
    static func getHolidays(from value: Any) -> [Holiday] {
        guard let holidaysData = value as? [[String: Any]] else { return [] }
        return holidaysData.map { Holiday(holiday: $0) }
    }
}
