//
//  BeastsFirebase.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 03/11/21.
//

struct BeastsFirebase: Codable {
    
    var name: String = ""
    
    internal init(name: String = "") {
        self.name = name
    }
}
