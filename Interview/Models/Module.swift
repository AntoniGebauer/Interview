//
//  Module.swift
//  Interview
//
//  Created by Antoni Gebauer on 19/07/2022.
//

import Foundation

struct Module: Decodable, Identifiable {
    
    var id: Int
    var name: String
    var content: Content
}
