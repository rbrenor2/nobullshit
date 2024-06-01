//
//  Blockout.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import FirebaseFirestoreSwift

struct Blockout: Codable, Identifiable {
    @DocumentID var id: String?
    var blocks: [Block]
    
    enum CodingKeys: String, CodingKey {
        case id
        case blocks
    }
}
