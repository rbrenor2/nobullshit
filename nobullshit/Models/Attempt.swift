//
//  Attempt.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import FirebaseFirestoreSwift

struct AttemptResult: BaseModel {
    @DocumentID var id: String?
    var repetitions: Int?
    var duration: Float?
    var weight: Float?
    
    enum CodingKeys: String, CodingKey {
        case id
        case repetitions
        case duration
        case weight
    }
}

struct Attempt: BaseModel {
    @DocumentID var id: String?
    var blockoutRef: String
    var cancelledAt: String
    var finishedAt: String
    var startedAt: String
    var result: AttemptResult
    
    enum CodingKeys: String, CodingKey {
        case id
        case blockoutRef
        case cancelledAt
        case finishedAt
        case startedAt
        case result
    }
}
