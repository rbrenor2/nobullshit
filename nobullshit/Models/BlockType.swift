//
//  BlockType.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import FirebaseFirestoreSwift

struct BlockType: Codable, Identifiable {
    @DocumentID var id: String?
    var description: String
    var displayName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case displayName
    }
}
