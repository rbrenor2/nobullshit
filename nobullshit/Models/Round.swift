//
//  Round.swift
//  nobullshit
//
//  Created by Breno R R on 02/06/2024.
//

import FirebaseFirestoreSwift

enum RoundType: String, Codable {
    case PREPARE = "PREPARE"
    case WORK = "WORK"
    case REST = "REST"
}

struct Round: Codable, Identifiable {
    @DocumentID var id: String?
    var type: RoundType
    var countTo: Int
    var exercise: Exercise?
    var repetitions: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case countTo
        case exercise
        case repetitions
    }
}
