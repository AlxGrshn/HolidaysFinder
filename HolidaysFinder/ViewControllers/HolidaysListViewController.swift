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
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        holidays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let holiday = holidays[indexPath.row]
        
        
//        content.text = person.fullName
//        cell.contentConfiguration = content
        
        return cell
    }
}
