//
//  Beasts.swift
//  HogwartsApp
//
//  Created by Daniel Washington Ignacio on 17/09/21.
//

import Foundation

struct Beasts {
    
    var name: String?
    var avatar: String?
    var characteristics: String?
    
    
    init(dictionary: [String: Any]) {
        
        self.name = dictionary["name"] as? String
        self.avatar = dictionary["avatar"] as? String
        self.characteristics = dictionary["characteristics"] as? String
        
    }
    
}
