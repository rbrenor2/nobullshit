//
//  UserProfile.swift
//  br2-ios-base
//
//  Created by Breno R R on 23/05/2024.
//

import FirebaseFirestoreSwift
import FirebaseFirestore
import Foundation

struct UserProfile: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var accountType: String
    var showOnboarding: Bool
    var isTrial: Bool
    var trialEndDate: Date?
    var level: Int
    var points: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case accountType
        case showOnboarding
        case isTrial
        case trialEndDate
        case level
        case points
    }
}
