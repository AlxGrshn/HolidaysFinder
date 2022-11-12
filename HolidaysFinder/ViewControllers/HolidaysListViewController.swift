//
//  HolidaysListViewController.swift
//  HolidaysFinder
//
//  Created by Alexander Grishin on 08.11.2022.
//

import UIKit
import Alamofire

class HolidaysListViewController: UITableViewController {
    private var holidays: [Holidays] = []
    
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
        AF.request(RegionLinks.russia.rawValue)
            .validate()
            .responseJSON { [weak self] dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let holidays = value as? [[String: Any]] else { return }
                    
                    for holiday in holidays {
                        let holiday = Holidays(
                            name: holiday["name"] as? String ?? "",
                            localName: holiday["localName"] as? String ?? "",
                            date: holiday["date"] as? String ?? ""
                        )
                        self?.holidays.append(holiday)
                    }
                    
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
    }
}
