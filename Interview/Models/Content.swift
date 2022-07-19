//
//  Content.swift
//  Interview
//
//  Created by Antoni Gebauer on 19/07/2022.
//

import Foundation

struct Content: Decodable, Identifiable {
    
    var id:Int
    var image:String
    var details:[Details]
    
}
