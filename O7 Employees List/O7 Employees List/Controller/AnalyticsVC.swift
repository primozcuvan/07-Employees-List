//
//  AnalyticsVC.swift
//  O7 Employees List
//
//  Created by Primoz Cuvan on 25/03/2020.
//  Copyright © 2020 Primoz Cuvan. All rights reserved.
//

import UIKit

class AnalyticsVC: UIViewController {

    @IBOutlet weak var analyticsTableView: UITableView!
    
//    let date = Date()
//    let calendar = Calendar.current
    
    var agesOfTheEmployees : [Int] = [] // Variable for all ages
    
    let analyticsCategories : [String] = ["Average age", "Median age", "Max Salary", "Male vs Female workers ratio"]
    var analyticsResults : [String] = []
    
    var analyticsFunctions = AnalyticsFunctions()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        analyticsTableView.delegate = self
        analyticsTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        analyticsResults = [] // Reset the results every time the view will appear
        
        agesOfTheEmployees = analyticsFunctions.getAge(birthdays: employee.birthdayDate)
        
        let averageAge = analyticsFunctions.averageAge(arrayOfAges: agesOfTheEmployees)
        analyticsResults.append(averageAge)
        
        let medianAge = analyticsFunctions.medianAge(arrayOfAges: agesOfTheEmployees)
        analyticsResults.append(medianAge)
        
        let maxSalary = analyticsFunctions.maxSalary(arrayOfSalaries: employee.salary)
        analyticsResults.append(maxSalary)
        
        let roundedRatio = analyticsFunctions.maleVsFemaleRatio(gendersOfEmployees: employee.gender)
        analyticsResults.append(roundedRatio)
    
        analyticsTableView.reloadData() // Reload each time the view will appear
    }
    
}

//MARK: Table View
extension AnalyticsVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return analyticsCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "ReusableAnalyticsCell")
        
        cell.textLabel?.text = "\(analyticsCategories[indexPath.row])"
        if indexPath.row != 2 {
            cell.detailTextLabel?.text = "\(analyticsResults[indexPath.row])"
        } else {
            cell.detailTextLabel?.text = "\(analyticsResults[indexPath.row]) €"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false // The highlight of the row on click is disabled
    }
    
    
}
