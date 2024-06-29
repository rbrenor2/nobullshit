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

struct Block: Codable,Identifiable, Equatable {
    @DocumentID var id: String?
    let type: CountType
    var excercises: [String]?
    var work: Int
    var rounds: Int
    var rest: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case excercises
        case work
        case rounds
        case rest
    }
    
    init(type: CountType, excercises: [String]? = nil, work: Int? = nil, rounds: Int? = nil, rest: Int? = nil) {
        self.id = UUID().uuidString
        self.type = type
        self.excercises = excercises
        self.work = work ?? 20
        self.rounds = rounds ?? 3
        self.rest = rest ?? 10
    }
    
    static func == (lhs: Block, rhs: Block) -> Bool {
        lhs.id == rhs.id
    }
}
