//
//  UserManager.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 03/11/21.
//

import FirebaseAuth

protocol UserIdManaging {
    var id: String? { get }
}

final class UserIdManager: UserIdManaging {
    var id: String? {
        let session = Auth.auth()
        let user = session.currentUser
        return user?.uid
    }
}
