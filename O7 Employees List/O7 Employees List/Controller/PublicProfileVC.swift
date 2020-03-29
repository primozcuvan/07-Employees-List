//
//  PublicProfileVC.swift
//  O7 Employees List
//
//  Created by Primoz Cuvan on 25/03/2020.
//  Copyright © 2020 Primoz Cuvan. All rights reserved.
//

import UIKit
import SafariServices

class PublicProfileVC: UIViewController {

    
    @IBOutlet weak var publicProfileTableView: UITableView!
    
    var webData = GetData()
    
    var headersTitle : [String] = []
    var headersUrl : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(employee.name)
        print("Employee: \(employee.name[employeeSelectedIndex])")
        
        publicProfileTableView.delegate = self
        publicProfileTableView.dataSource = self
        
        //MARK: Get web data
        headersTitle = []
        headersUrl = []
        
        let apiKey = webData.apiKey
        let searchEngineId = webData.searchEngineId
        
        let request = webData.getKeys(apiKey: apiKey, searchEngineId: searchEngineId)
        
        let datatask = webData.session.dataTask(with: request as URLRequest) { (data, response, error) in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {

                    if let items = jsonResult["items"] as? NSArray {
                        for i in 0...4 {
                            let oneItem = items[i] as? NSDictionary

                            // This will happen on a background thread and update the main thread when it is finished
                            DispatchQueue.main.async {
                                var htmlTitle : String = String(describing:oneItem!["htmlTitle"]!)
                                htmlTitle = htmlTitle.replacingOccurrences(of: "<b>", with: "")
                                htmlTitle = htmlTitle.replacingOccurrences(of: "</b>", with: "")
                                htmlTitle = htmlTitle.replacingOccurrences(of: "&amp;", with: "&")

                                var htmlUrl : String = String(describing:oneItem!["formattedUrl"]!)
                                htmlUrl = htmlUrl.replacingOccurrences(of: "<b>", with: "")
                                htmlUrl = htmlUrl.replacingOccurrences(of: "</b>", with: "")
                                htmlUrl = htmlUrl.replacingOccurrences(of: "&amp;", with: "&")

                                self.headersTitle.append(htmlTitle)
                                self.headersUrl.append(htmlUrl)

                                // Reload table view after the data was fetched from web
                                self.publicProfileTableView.reloadData()
//                                print("Title: \(self.headersTitle)")
//                                print("URL: \(self.headersUrl)")
                            }
                        }
                        
                    } else {
                        print("Error")
                        // Create alert
                        let alert = UIAlertController(title: "Error", message: "No information can be found for the employee \(employee.name[employeeSelectedIndex]).", preferredStyle: .alert)
                        
                        let restartAction = UIAlertAction(title: "Continue", style: .default) { (UIAlertAction) in
                        }
                        
                        alert.addAction(restartAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            catch let error as NSError {
                print("Error:")
                print(error.localizedDescription)
            }
        }
        datatask.resume()
    }
}

//MARK: TableView
extension PublicProfileVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headersTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "ReusablePublicProfileCell")
        
        cell.textLabel?.text = headersTitle[indexPath.row]
        cell.detailTextLabel?.text = headersUrl[indexPath.row]
        cell.detailTextLabel?.textColor = .systemGray
        
        return cell
    }
    
    // Present Safari view controller to open selected link
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var urlString = headersUrl[indexPath.row]
        // Check if the urlString contains https:// or http://
        if urlString.contains("https://") || urlString.contains("http://") {
            print("OK")
        } else { // If not, add the string https:// to the urlString at the beginning
            urlString = "https://" + urlString
        }
        
        if let url = URL(string: urlString) {
            return present(SFSafariViewController(url: url), animated: true, completion: nil)
        } else {
            print("Error")
        }
    }
    
    // TableView Header functions
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Employee: \(employee.name[employeeSelectedIndex])"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
}
