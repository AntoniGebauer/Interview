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
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // Current content selected
    @Published var currentContentSelected:Int?
    var currentContentIndex = 0

    // Current detail
    @Published var currentDetail: Details?
    var currentDetailIndex = 0
    
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
        
        session.dataTask(with: request) { (data, response, error) in
            
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
                print("Couldn't parse JSON Data")
            }
        }.resume()
        
    }
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
        
    }
    
    // MARK: Module navigation methods
    
    func beginModule(_ moduleid:Int) {
        
        // Find the index for this module id
        for index in 0..<modules.count {
            
            if modules[index].id == moduleid {
            
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func showDetail(_ detailIndex:Int) {
        
        if detailIndex < currentModule!.content.details.count {
            currentDetailIndex = detailIndex
        }
        else {
            currentDetailIndex = 0
        }
        
        // Set the current detail
        currentDetail = currentModule!.content.details[currentDetailIndex]
    }
    
}
