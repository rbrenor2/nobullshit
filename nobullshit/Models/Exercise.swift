//
//  Exercise.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import FirebaseFirestoreSwift

struct Exercise: Codable, Identifiable {
    @DocumentID var id: String?
    var description: String
    var difficulty: String
    var instructionsUrl: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case difficulty
        case instructionsUrl
        case name
    }
}
