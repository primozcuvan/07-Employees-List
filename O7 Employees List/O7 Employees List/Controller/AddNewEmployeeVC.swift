//
//  AddNewEmployeeVC.swift
//  O7 Employees List
//
//  Created by Primoz Cuvan on 25/03/2020.
//  Copyright © 2020 Primoz Cuvan. All rights reserved.
//

import UIKit

class AddNewEmployeeVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!
    @IBOutlet weak var genderPicker: UISegmentedControl!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genderPicker.setTitle("Male", forSegmentAt: 0)
        genderPicker.setTitle("Female", forSegmentAt: 1)
        
        birthdayPicker()
        
    }
    
    
    //MARK: Birthday Picker
    func birthdayPicker() {
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done
            , target: nil, action: #selector(donePressed))
        
        // asign toolbar
        birthdayTextField.inputAccessoryView = toolbar
        toolbar.setItems([doneButton], animated: true)
        
        // asign date picker to the text field
        birthdayTextField.inputView = datePicker
        
        // date picker mode
        datePicker.datePickerMode = .date
        
    }
    
    @objc func donePressed(textField : UITextField) {
        // Formatter time
        let formatter = DateFormatter()
        formatter.dateFormat = "dd. MM. yyyy"
        
        // Insert text to text field
        birthdayTextField.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    

    //MARK: Add Button
    @IBAction func addEmployeeButtonPressed(_ sender: Any) {
        
        if nameTextField.text != "" && surnameTextField.text != "" && salaryTextField.text != "" && birthdayTextField.text != "" {
            
            // Append name
            employee.name.append("\(nameTextField.text!) \(surnameTextField.text!)")
            
            // Generate random ID
            let id = UUID().uuidString
            employee.id.append(id)
            
            // Append Birthday
            employee.birthdayDate.append(birthdayTextField.text!)
            
            // Append Gender
            employee.gender.append("\(genderPicker.titleForSegment(at: genderPicker.selectedSegmentIndex)!)")
            
            // Append Salary
            employee.salary.append(Int(salaryTextField.text!)!)
            
            // Go back to EmployeesListVC
            navigationController?.popViewController(animated: true)
            
        } else {
            
            // Create alert
            let alert = UIAlertController(title: "Not enough information", message: "You need to provide all required information to add an employee.", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Continue", style: .default) { (UIAlertAction) in
            }
            
            alert.addAction(restartAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}
