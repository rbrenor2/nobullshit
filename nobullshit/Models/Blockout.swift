//
//  Blockout.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Blockout: BaseModel {    
    @DocumentID var id: String?
    var name: String
    var creatorId: String
    var blocks: [Block]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case creatorId
        case blocks
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(creatorId, forKey: .creatorId)
        try container.encode(blocks, forKey: .blocks)
    }
}
