//
//  EmployeeTableViewCell.swift
//  O7 Employees List
//
//  Created by Primoz Cuvan on 25/03/2020.
//  Copyright © 2020 Primoz Cuvan. All rights reserved.
//

import UIKit
import Foundation

class EmployeeTableViewCell: UITableViewCell {

   
   // Cell label
   @IBOutlet weak var employeeInfoLabel: UILabel!
   
   func getEmployeeInfo(name : String, id : String, birthday : String, gender : String, salary : Int) {
       // Define cell's text
       let text = NSMutableAttributedString(string: name , attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
       // Append Employee details
       text.append(NSAttributedString(
           string:  "ID: \(id)\nBirthday: \(birthday)\nGender: \(gender)\nSalary: \(salary) €",
           attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
       
       employeeInfoLabel.attributedText = text
   }
       
   

}
