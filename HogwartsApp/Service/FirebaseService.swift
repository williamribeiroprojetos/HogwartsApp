//
//  FirebaseUser.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 03/11/21.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol FirebaseServiceRepositoring {
    func saveFavoriteBeasts(id: String, data: BeastsFirebase)
    func readFavoriteBeasts(email: String, completion: @escaping ((Result<[BeastsFirebase], Error>)->Void))
    func saveFavoriteCharacters(id: String, data: CharactersFirebase)
    func readFavoriteCharacters(email: String, completion: @escaping ((Result<[CharactersFirebase], Error>)->Void))
}

class FirebaseService: FirebaseServiceRepositoring {
    
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
    
    func saveFavoriteBeasts(id: String, data: BeastsFirebase) {
        guard let idReference = referenceUser?.collection("User"), !id.isEmpty else {
            return
        }
        do {
            try idReference.document(id).setData(from: data, merge: true)
        } catch (let e) {
            print("[FIREBASE ERROR]: Error writing routine to Firestore: \(e)")
        }
    }
    
    func readFavoriteBeasts(email: String, completion: @escaping ((Result<[BeastsFirebase], Error>) -> Void)) {
        var userDataItems: [BeastsFirebase] = []
        guard let idReference = referenceUser?.collection("User") else {
            return
        }
        idReference.whereField("email", isEqualTo: email).getDocuments { querySnapshot, error in
            if error != nil {
                print("Error Reading Firebase: \(String(describing: error))")
                completion(.failure((ServiceError.failureReading)))
                return
            }

            guard let snapshot = querySnapshot else {
                return
            }
            
            userDataItems = snapshot.documents.compactMap { document in
                let userFirebase = try? document.data(as: BeastsFirebase.self)
                return userFirebase
            }
            completion(.success(userDataItems))
        }
    }
    
    func saveFavoriteCharacters(id: String, data: CharactersFirebase) {
        
    }
    
    func readFavoriteCharacters(email: String, completion: @escaping ((Result<[CharactersFirebase], Error>)->Void)) {
        
    }
}
