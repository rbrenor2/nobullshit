//
//  Attempt.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import FirebaseFirestoreSwift

struct Attempt: Codable, Identifiable {
    @DocumentID var id: String?
    var blockoutRef: String
    var cancelledAt: String
    var finishedAt: String
    var startedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case blockoutRef
        case cancelledAt
        case finishedAt
        case startedAt
    }
}
