//
//  CharactersFirebase.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 10/11/21.
//

struct CharactersFirebase: Decodable {
    
    var id: String = ""
    var name: String = ""
    
    internal init(name: String = "", id: String = "") {
        self.id = id
        self.name = name
    }
}
