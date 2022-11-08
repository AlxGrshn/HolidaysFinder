//
//  HolidaysListViewController.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

import UIKit

class HolidaysListViewController: UITableViewController {
    private var holidays: [Holidays] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 130
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        holidays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? HolidayCell else { return UITableViewCell() }
        let holiday = holidays[indexPath.row]
        cell.configure(with: holiday)
        return cell
    }
}

extension HolidaysListViewController {
   
}
