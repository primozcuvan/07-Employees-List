//
//  ViewController.swift
//  O7 Employees List
//
//  Created by Primoz Cuvan on 25/03/2020.
//  Copyright © 2020 Primoz Cuvan. All rights reserved.
//

import UIKit

var employeeSelectedIndex : Int = 0 // Global variable

class EmployeesListVC: UIViewController {

    @IBOutlet weak var employeesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate and dataSource to self
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
        employeesTableView.reloadData()
        
        // This is run only the first time this screen appears
        if employee.id.count == 0 {
            // Get IDs for predefined employees
            getIDs()
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        employeesTableView.reloadData() // Every time this view did load table view will refresh it's data
    }
    
    func getIDs() {
        // For each predefined employee generate random ID
        for _ in 0...employee.name.count - 1 {
            let id = UUID().uuidString
            employee.id.append(id)
        }
    }
    
    //MARK: Add New Button
    @IBAction func addNewButtonPressed(_ sender: Any) {
        // Go to GoToAddNewEmployeeVC
        performSegue(withIdentifier: "GoToAddNewEmployeeVC", sender: self)
    }
    
}

//MARK: TableView
extension EmployeesListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a cell that can be reused for each new cell at IndexPath.row
        let cell = employeesTableView.dequeueReusableCell(withIdentifier: "ReusableEmployeeCell") as! EmployeeTableViewCell
        // Using custom cell (EmployeeTableViewCell)
        // Identifier is set in Main.storyboard in the ReusableEmployeeCell's Atribute Inspector under Table View Cell property named: Identifier
         
        // Call function getEmployeeInfo and insert employee's info
        cell.getEmployeeInfo(
            name: "\(employee.name[indexPath.row])\n",
            id: "\(employee.id[indexPath.row])",
            birthday: "\(employee.birthdayDate[indexPath.row])",
            gender: "\(employee.gender[indexPath.row])",
            salary: employee.salary[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Go To PublicProfileVC
        performSegue(withIdentifier: "GoToPublicProfileVC", sender: self)
        // Asign indexPath.row to employeeSelectedIndex so the PublicProfileVC will display right information
        employeeSelectedIndex = indexPath.row
    }
    
}

