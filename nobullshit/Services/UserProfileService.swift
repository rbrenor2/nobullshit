//
//  UserProfileService.swift
//  br2-ios-base
//
//  Created by Breno R R on 23/05/2024.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift


struct UserProfileService {
    static let shared = UserProfileService()
    
    private init() { }
    
    private let db = Firestore.firestore()
    
    func getUserProfile(email: String) -> AnyPublisher<UserProfile, Error> {
        Future { promise in
            let docRef = self.db.collection(ResourcePaths.userProfiles.rawValue).document(email)
            
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    do {
                        let userProfile = try document.data(as: UserProfile.self)
                                                promise(.success(userProfile))
                    } catch {
                        promise(.failure(error))
                    }
                } else {
                    let error = GeneralError.documentNotFound
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    // No Bullshit
    func getUserAttempts() -> AnyPublisher<[Attempt], Error> {
        Future { promise in
            let collectionRef = self.db.collection(ResourcePaths.attempts.rawValue)
            
            collectionRef.getDocuments { (querySnapshot, error) in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    promise(.failure(GeneralError.documentNotFound))
                    return
                }
                
                do {
                    let preferences = try documents.compactMap { document -> Attempt? in
                        try document.data(as: Attempt.self)
                    }
                    promise(.success(preferences))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
