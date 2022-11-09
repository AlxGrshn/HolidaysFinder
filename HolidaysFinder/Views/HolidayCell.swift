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
    
    func configure(with holiday: Holidays) {
        nameLabel.text = holiday.name
        localNameLabel.text = holiday.localName
        dataLabel.text = holiday.date
        holidayImage.image = UIImage(named: "ballons")
    }
}
