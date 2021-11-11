//
//  BeastsFirebase.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 03/11/21.
//

struct BeastsFirebase: Encodable {
    
    var id: String = ""
    var name: String = ""
    
    internal init(name: String = "", id: String = "") {
        self.id = id
        self.name = name
    }
}
