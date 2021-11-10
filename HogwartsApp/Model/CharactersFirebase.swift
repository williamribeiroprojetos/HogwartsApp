//
//  CharactersFirebase.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 10/11/21.
//

struct CharactersFirebase: Codable {
    
    var name: String = ""
    
    internal init(name: String = "") {
        self.name = name
    }
}
