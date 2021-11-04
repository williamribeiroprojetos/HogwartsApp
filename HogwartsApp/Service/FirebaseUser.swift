//
//  FirebaseUser.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 03/11/21.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol FirebaseUserRepositoring {
    func saveUser(id: String, data: SaveUserFirebase)
    func readUser(email: String, completion: @escaping ((Result<[SaveUserFirebase], Error>)->Void))
}

class FirebaseUser: FirebaseUserRepositoring {
    
    let userManager: UserIdManaging

    init(userManager: UserIdManaging = UserIdManager()) {
        self.userManager = userManager
    }

    private let database = Firestore.firestore()
    private lazy var referenceUser: DocumentReference? = {
        let usersCollectionReference = database.collection("UserData")
        guard let id = userManager.id else { return nil }
        return usersCollectionReference.document(id)
    }()
    
    func saveUser(id: String, data: SaveUserFirebase) {
        guard let idReference = referenceUser?.collection("User"), !id.isEmpty else {
            return
        }
        do {
            try idReference.document(id).setData(from: data, merge: true)
        } catch (let e) {
            print("[FIREBASE ERROR]: Error writing routine to Firestore: \(e)")
        }
    }
    
    func readUser(email: String, completion: @escaping ((Result<[SaveUserFirebase], Error>) -> Void)) {
        var userDataItems: [SaveUserFirebase] = []
        guard let idReference = referenceUser?.collection("User") else {
            return
        }
        idReference.whereField("email", isEqualTo: email).getDocuments { querySnapshot, error in
            if error != nil {
                print("Error Reading Firebase: \(error)")
                completion(.failure((ServiceError.failureReading)))
                return
            }

            guard let snapshot = querySnapshot else {
                return
            }
            
            userDataItems = snapshot.documents.compactMap { document in
                let userFirebase = try? document.data(as: SaveUserFirebase.self)
                return userFirebase
            }
            completion(.success(userDataItems))
        }
    }
}
