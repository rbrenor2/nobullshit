//
//  PreferenceService.swift
//  br2-ios-base
//
//  Created by Breno R R on 23/05/2024.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct PreferenceService {
    static let shared = PreferenceService()
    
    private init() { }
    
    private let db = Firestore.firestore()
    
    func getPreferencesDefinitions() -> AnyPublisher<[PreferenceDefinition], Error> {
        Future { promise in
            let collectionRef = self.db.collection(ResourcePaths.preferences.rawValue)
            
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
                    let preferences = try documents.compactMap { document -> PreferenceDefinition? in
                        try document.data(as: PreferenceDefinition.self)
                    }
                    promise(.success(preferences))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getPreferencesForUser(email: String) -> AnyPublisher<[Preference], Error> {
        Future { promise in
            let collectionRef = self.db.collection("\(ResourcePaths.userProfiles.rawValue)/\(email)/\(ResourcePaths.preferences.rawValue)")
            
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
                    let preferences = try documents.compactMap { document -> Preference? in
                        try document.data(as: Preference.self)
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
