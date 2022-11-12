//
//  HolidayCell.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

import UIKit

class HolidayCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var localNameLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!
    @IBOutlet var holidayImage: UIImageView!
    
    func configure(with holiday: Holiday) {
        nameLabel.text = holiday.name
        localNameLabel.text = holiday.localName
        dataLabel.text = holiday.date
        holidayImage.image = UIImage(named: getImage(with: holiday.name))
    }
}

extension HolidayCell {
    private func getImage(with name: String) -> String {
        switch name {
        case "New Year\'s Day":
            return "newYear"
        case "New Year holiday":
            return "newYearHolidays"
        case "Orthodox Christmas Day":
            return "oldNewYear"
        case "Defender of the Fatherland Day":
            return "defenderDay"
        case "International Women\'s Day":
            return "womenDay"
        case "Labour Day":
            return "labourDay"
        case "Victory Day":
            return "victoryDay"
        case "Russia Day":
            return "russiaDay"
        case "Unity Day":
            return "unityDay"
        default:
            return "balloons"
        }
    }
}
