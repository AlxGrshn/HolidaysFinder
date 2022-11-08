//
//  Holidays.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

struct Holidays: Decodable {
    let date: String
    let localName: String
    let name: String
    let countryCode: String
}
