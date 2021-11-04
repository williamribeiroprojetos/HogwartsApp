//
//  ServiceError.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 04/11/21.
//

enum ServiceError: Error {
    case invalidData
    case nonExistanceData
    case decoding
    case wrongEmailOrPassword
    case failure
    case signInAgain
    case failureSaving
    case failureReading
}
