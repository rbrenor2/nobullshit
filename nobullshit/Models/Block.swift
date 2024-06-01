//
//  Block.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import FirebaseFirestoreSwift

struct Block: Codable, Identifiable {
    @DocumentID var id: String?
    var countType: String
    var rounds: Int
    var type: String
    var exercises: [BlockExercise]
    
    enum CodingKeys: String, CodingKey {
        case id
        case countType
        case rounds
        case type
        case exercises
    }
}

struct BlockExercise: Codable, Identifiable {
    var id: String
    var exercise: Exercise
    var timeInSeconds: Int
    var repetitions: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case timeInSeconds
        case repetitions
        case exercise
    }
}
