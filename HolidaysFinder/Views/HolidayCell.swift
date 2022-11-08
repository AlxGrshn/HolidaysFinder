//
//  HolidayCell.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

import UIKit

class HolidayCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var localName: UILabel!
    @IBOutlet var data: UILabel!
    @IBOutlet var holidayImage: UIImageView!
    
    func configure(with holiday: Holidays) {
        name.text = holiday.name
        localName.text = holiday.localName
        data.text = holiday.date
    }
}
