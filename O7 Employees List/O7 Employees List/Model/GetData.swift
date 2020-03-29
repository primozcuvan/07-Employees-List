//
//  GetData.swift
//  O7 Employees List
//
//  Created by Primoz Cuvan on 27/03/2020.
//  Copyright © 2020 Primoz Cuvan. All rights reserved.
//

import Foundation



struct GetData {
    
    let apiKey = "AIzaSyCRuyGNgZKMXPgVqU3pPE5wgR1_DNEdync"
    let searchEngineId = "009108394149091639730:tfg2lmylkkv"
    let session = URLSession(configuration: .default)
    
    func getKeys(apiKey: String, searchEngineId: String) -> NSMutableURLRequest {
        let serverAddress = String(format: "https://www.googleapis.com/customsearch/v1?q=%@&cx=%@&key=%@","\(employee.name[employeeSelectedIndex])" ,searchEngineId, apiKey)

        let url = serverAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let finalUrl = URL(string: url!)
        let request = NSMutableURLRequest(url: finalUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        
        return request
    }
    
}


