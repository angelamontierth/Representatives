//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Angela Montierth on 2/27/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php?")
    
    /*
     
     - Add anything to url needed to make a request
     - Create a request and wait for the response
     - Handle error if there is one
     - Serialize data into json
     - Parse json as needed
     - Turn jsonDictionaries into model objects (Using the failable initializer.)
     - Call completion (with model object/objects)
     
     */

    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        
        // - Add anything to url needed to make a request
        
        guard let unwrappedURL = baseURL else { return }
        
        let parameters = ["state": state,
                          "output": "json"]
        // Create a request and wait for the response

        NetworkController.performRequest(for: unwrappedURL, httpMethod: .Get, urlParameters: parameters, body: nil) { (data, error) in
            
            //    - Handle error if there is one
            
            if let error = error {
                print(error)
                completion([])
                return
            }
            
            
             // Serialize data into json
            
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] else { completion ([]); return }
            
            // Parse json as needed
            
            guard let representativeDictionary = jsonDictionary["results"] as? [[String:Any]]
                else { completion([]); return }
            
            // Turn jsonDictionaries into model objects (Using the failable initializer.)
            
            
            let representatives = representativeDictionary.flatMap({ Representative(dictionary: $0)})
            
            completion(representatives)
        
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
}
