//
//  AccountService.swift
//  br2-ios-base
//
//  Created by Breno R R on 26/05/2024.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AccountService {
    static let shared = AccountService()
    
    private init() { }
    
    private let db = Firestore.firestore()
    
    func getAccountsDefinition() -> AnyPublisher<[AccountDefinition], Error> {
        Future { promise in
            let collectionRef = self.db.collection(ResourcePaths.accountTypes.rawValue)
            
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
                    let preferences = try documents.compactMap { document -> AccountDefinition? in
                        try document.data(as: AccountDefinition.self)
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
