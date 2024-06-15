//
//  BlockService.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct BlockoutService {
    static let shared = BlockoutService()
    
    private init() { }
    
    private let db = Firestore.firestore()
    
    func getBlockoutOfTheDay(email: String) -> AnyPublisher<Blockout, Error> {
        Future { promise in
            let docRef = self.db.collection(ResourcePaths.blockouts.rawValue).document(email)
            
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    do {
                        let blockout = try document.data(as: Blockout.self)
                                                promise(.success(blockout))
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
}


