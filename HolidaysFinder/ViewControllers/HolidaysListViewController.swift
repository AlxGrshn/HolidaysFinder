//
//  HolidaysListViewController.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

import UIKit

class HolidaysListViewController: UITableViewController {
    private var holidays: [Holiday] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHolidays()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        holidays.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? HolidayCell else { return UITableViewCell() }
        let holiday = holidays[indexPath.row]
        cell.configure(with: holiday)
        
        cell.layer.cornerRadius = 20
        cell.layer.borderColor = UIColor.systemBackground.cgColor
        cell.layer.borderWidth = 5
        cell.backgroundColor = .systemGray6
        
        return cell
    }
}

extension HolidaysListViewController {
    private func fetchHolidays() {
        NetworkManager.shared.fetchHolidays(from: RegionLinks.russia.rawValue) { [weak self] result in
            switch result {
            case .success(let holidays):
                self?.holidays = holidays
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
