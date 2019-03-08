//
//  CountryModel.swift
//  CodableExample
//
//  Created by Tendaishe Gwini on 08/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit


class CountryModel: Codable {
    
    var name = String()
    var capital = String()
    var region = String()
    
}


class CountryManager {
    
    
    func fetchCountries(completionHandler: @escaping (_ data: [CountryModel], _ error: Error?) -> Void) {
        
        var countries: [CountryModel] = []
        let urlString = "https://restcountries.eu/rest/v2/all"
        let url = URL(string: urlString)
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                completionHandler(countries,error)
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    countries = try decoder.decode([CountryModel].self, from: data)
                    completionHandler(countries,error)
                } catch {
                    completionHandler(countries,error)
                }
            }
        }
        task.resume()

        
    }
    
}





