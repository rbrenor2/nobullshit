//
//  Exercise.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import FirebaseFirestoreSwift

enum ExerciseLevel: String, Codable {
    case BEGINNER = "Beginner"
    case INTERMEDIARY = "Intermediary"
    case ADVANCED = "Advanced"
}

struct Exercise: BaseModel {
    @DocumentID var id: String?
    var description: String
    var level: ExerciseLevel
    var instructionsUrl: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case level
        case instructionsUrl
        case name
    }
}
