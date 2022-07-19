//
//  ContentModel.swift
//  Interview
//
//  Created by Antoni Gebauer on 19/07/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    init() {
        getRemoteData()
    }
    
    // MARK: Data Methods
    
    func getRemoteData() {
        
        // String path
        let urlString = "https://antonigebauer.github.io/Interview---data/data.json"
        
        // Create a url object
        let url = URL(string: urlString)
        
        guard url != nil else {
            // Couldn't create url
            return
        }
        
        // Create a URLRequest object
        let request = URLRequest(url: url!)
        
        // Get the session and kick off the task
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            // Check if there's an error
            guard error == nil else {
                // There was an error
                return
            }
            
            do {
                // Create json decoder
                let decoder = JSONDecoder()
            
                // Decode
                let modules = try decoder.decode([Module].self, from: data!)
                
                // Append parsed modules into modules property
                self.modules += modules
            }
            catch {
                // Couldn't parse json
                print("Couldn't parse JSON")
            }
        }
        
        // Kick off data task
        dataTask.resume()
        
    }
}
