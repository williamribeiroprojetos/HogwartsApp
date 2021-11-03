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
    func saveFeedback(id: String, data: FirebaseUser)
    func readFeedback(idFather: String, completion: @escaping ((Result<[FirebaseUser], Error>)->Void))
}

class FirebaseUser: FirebaseUserRepositoring {
    
    let userManager: UserIdManaging

    init(userManager: UserIdManaging = UserIdManager()) {
        self.userManager = userManager
    }

    private let database = Firestore.firestore()
    private lazy var referenceUser: DocumentReference? = {
        let usersCollectionReference = database.collection("userPreference")
        guard let id = userManager.id else { return nil }
        return usersCollectionReference.document(id)
    }()
    
    func saveFeedback(id: String, data: FirebaseUser) {
        guard let idReference = referenceUser?.collection("UserData"), !id.isEmpty else {
            return
        }
        do {
            try idReference.document(id).setData(from: data, merge: true)
        } catch (let e) {
            print("[FIREBASE ERROR]: Error writing routine to Firestore: \(e)")
        }
    }
    
    func readFeedback(email: String, completion: @escaping ((Result<[FirebaseUser], Error>) -> Void)) {
        var feedbackItems: [FirebaseUser] = []
        guard let idReference = referenceUser?.collection("feedback") else {
            return
        }
        idReference.whereField("email", isEqualTo: email).getDocuments { querySnapshot, error in
            if error != nil {
                print("Error Reading Firebase: \(error ?? "")")
                completion(.failure((ServiceError.failureReading)))
                return
            }

            guard let snapshot = querySnapshot else {
                return
            }
            
            feedbackItems = snapshot.documents.compactMap { document in
                let feedbackFirebase = try? document.data(as: FirebaseUser.self)
                return feedbackFirebase
            }
            completion(.success(feedbackItems))
        }
    }
}
