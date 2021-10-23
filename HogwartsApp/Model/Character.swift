//
//  Character.swift
//  HogwartsApp
//
//  Created by Daniel Washington Ignacio on 01/09/21.
//

import Foundation

// MARK: - Model
struct Character: Decodable {
    let name: String
    let species: String
    let gender: String
    let house: String
    let dateOfBirth: String
    let yearOfBirth: YearOfBirth
    let ancestry: String
    let eyeColour: String
    let hairColour: String
    let wand: Wand
    let patronus: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let actor: String
    let alive: Bool
    let image: String
}

// MARK: - Wand
struct Wand: Decodable {
    let wood, core: String
    let length: Length
}

enum YearOfBirth: Codable {
     case integer(Int)
     case string(String)

     init(from decoder: Decoder) throws {
          let container = try decoder.singleValueContainer()
          if let x = try? container.decode(Int.self) {
                self = .integer(x)
                return
          }
          if let x = try? container.decode(String.self) {
                self = .string(x)
                return
          }
          throw DecodingError.typeMismatch(YearOfBirth.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for YearOfBirth"))
     }

     func encode(to encoder: Encoder) throws {
          var container = encoder.singleValueContainer()
          switch self {
          case .integer(let x):
                try container.encode(x)
          case .string(let x):
                try container.encode(x)
          }
     }
}

enum Length: Codable {
     case double(Double)
     case string(String)

     init(from decoder: Decoder) throws {
          let container = try decoder.singleValueContainer()
          if let x = try? container.decode(Double.self) {
                self = .double(x)
                return
          }
          if let x = try? container.decode(String.self) {
                self = .string(x)
                return
          }
          throw DecodingError.typeMismatch(Length.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Length"))
     }

     func encode(to encoder: Encoder) throws {
          var container = encoder.singleValueContainer()
          switch self {
          case .double(let x):
                try container.encode(x)
          case .string(let x):
                try container.encode(x)
          }
     }
}
