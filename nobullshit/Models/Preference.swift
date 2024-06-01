//
//  Preference.swift
//  br2-ios-base
//
//  Created by Breno R R on 23/05/2024.
//

import FirebaseFirestoreSwift

enum PreferenceType: String {
    case TOGGLE = "TOGGLE"
    case TEXT_INPUT = "TEXT_INPUT"
    case INTEGER_INPUT = "INTEGER_INPUT"
    case FLOAT_INPUT = "FLOAT_INPUT"
    case DATE_INPUT = "DATE_INPUT"
}

enum BoolTypeInString: String {
    case TRUE = "TRUE"
    case FALSE = "FALSE"
}

struct Preference: Codable, Identifiable {
    @DocumentID var id: String?
    var displayName: String?
    var type: String?
    var valueText: String?
    var valueInt: Int?
    var valueBool: Bool?
    var valueFloat: Float?
    
    enum CodingKeys: String, CodingKey {
        case id
        case displayName
        case type
        case valueText
        case valueInt
        case valueBool
        case valueFloat
    }
}

struct PreferenceDefinition: Codable, Identifiable {
    @DocumentID var id: String?
    var type: String?
    var displayName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case displayName
    }
}


