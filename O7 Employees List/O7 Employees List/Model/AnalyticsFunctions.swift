//
//  AnalyticsFunctions.swift
//  O7 Employees List
//
//  Created by Primoz Cuvan on 27/03/2020.
//  Copyright © 2020 Primoz Cuvan. All rights reserved.
//

import Foundation

class AnalyticsFunctions {
    
    let date = Date()
    let calendar = Calendar.current
    
    
    //MARK: Get Employees Age
    func getAge(birthdays : [String]) -> [Int] {
        
        var agesOfTheEmployees : [Int] = [] // Variable for all ages
        
        let currentYear = calendar.component(.year, from: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd. MM. yyyy" // The format of the saved birthday dates
        
        for i in 0...birthdays.count - 1 {
            
            let birthdayDate = dateFormatter.date(from: "\(birthdays[i])")!
            let components = calendar.dateComponents([.year, .month, .day], from: birthdayDate)
            
            agesOfTheEmployees.append(currentYear - components.year!)
            
        }
        
        return agesOfTheEmployees
        
    }
    
    //MARK: Average
    func averageAge(arrayOfAges : [Int]) -> String {
        let sum = arrayOfAges.reduce(0, { x, y in x + y})
        let average = Float(sum / arrayOfAges.count)
        
        return String(average)
    }
    
    //MARK: Median
    func medianAge(arrayOfAges: [Int]) -> String {
        let sortedAges = arrayOfAges.sorted()
        if sortedAges.count % 2 == 0 {
            // If there is an uneven number of ages in the array
            let medianAge = Float((sortedAges[(sortedAges.count / 2)] + sortedAges[(sortedAges.count / 2) - 1])) / 2
            return String(medianAge)
        } else {
            // If there is an even number of ages in the array
            let medianAge = Float(sortedAges[(sortedAges.count - 1) / 2])
            return String(medianAge)
        }
    }
    
    //MARK: Max salary
    func maxSalary(arrayOfSalaries: [Int]) -> String  {
        return String(arrayOfSalaries.max()!)
    }
    
    //MARK: Male vs Female workers ratio
    func maleVsFemaleRatio(gendersOfEmployees : [String]) -> String {
        
        var numberOfMaleWorkers : Int = 0
        var numberOfFemaleWorkers : Int = 0
        
        for i in 0...gendersOfEmployees.count - 1 {
            if gendersOfEmployees[i] == "Male" { // If gender of worker on the i place is "Male"
                numberOfMaleWorkers += 1         // Increase number of male workers
            } else {                             // If gender of worker on the i place is "Female"
                numberOfFemaleWorkers += 1       // Increase number of female workers
            }
        }
        
        let ratio : String = "\(numberOfMaleWorkers)/\(numberOfFemaleWorkers)"
        
        return ratio
    }
}
