//
//  BlockEdit.swift
//  nobullshit
//
//  Created by Breno R R on 15/06/2024.
//
import SwiftUI
import FirebaseFirestoreSwift

enum CountType: String, Codable {
    case FORTIME = "FORTIME"
    case AMRAP = "AMRAP"
    case EMOM = "EMOM"
    case TABATA = "TABATA"
}

struct Block: BaseModel, Equatable {
    @DocumentID var id: String?
    var internalId: String
    let type: CountType
    var exercises: [String]
    var work: Int
    var rounds: Int
    var rest: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case internalId
        case type
        case exercises
        case work
        case rounds
        case rest
    }
    
    init(type: CountType, exercises: [String], work: Int? = nil, rounds: Int? = nil, rest: Int? = nil) {
        self.internalId = UUID().uuidString
        self.type = type
        self.exercises = exercises
        self.work = work ?? 20
        self.rounds = rounds ?? 3
        self.rest = rest ?? 10
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(internalId, forKey: .internalId)
        try container.encode(type, forKey: .type)
        try container.encode(exercises, forKey: .exercises)
        try container.encode(work, forKey: .work)
        try container.encode(rounds, forKey: .rounds)
        try container.encode(rest, forKey: .rest)
    }
    
    static func == (lhs: Block, rhs: Block) -> Bool {
        let lhsId = lhs.id != nil ? lhs.id : lhs.internalId
        let rhsId = rhs.id != nil ? rhs.id : rhs.internalId
        
        return lhsId == rhsId
    }
}
