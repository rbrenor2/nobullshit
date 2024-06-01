//
//  AccountType.swift
//  br2-ios-base
//
//  Created by Breno R R on 26/05/2024.
//

import FirebaseFirestoreSwift

enum AccountType: String {
    case FREE = "FREE"
    case PREMIUM = "PREMIUM"
}

struct AccountDefinition: Codable, Identifiable {
    @DocumentID var id: String?
    var displayName: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case displayName
        case description
    }
}
