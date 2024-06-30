//
//  UserProfile.swift
//  br2-ios-base
//
//  Created by Breno R R on 23/05/2024.
//

import FirebaseFirestoreSwift
import FirebaseFirestore

struct UserProfile: BaseModel {
    @DocumentID var id: String?
    var name: String
    var accountType: String
    var showOnboarding: Bool?
    var points: Int?
    var isTrial: Bool?
    var trialEndDate: Date?
    var level: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case accountType
        case showOnboarding
        case points
        case isTrial
        case trialEndDate
        case level
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.accountType = try container.decode(String.self, forKey: .accountType)
        self.showOnboarding = try container.decodeIfPresent(Bool.self, forKey: .showOnboarding)
        self.points = try container.decodeIfPresent(Int.self, forKey: .points)
        self.isTrial = try container.decodeIfPresent(Bool.self, forKey: .isTrial)
        
        if let timestamp = try container.decodeIfPresent(Timestamp.self, forKey: .trialEndDate) {
            self.trialEndDate = timestamp.dateValue()
        }
        
        self.level = try container.decodeIfPresent(Int.self, forKey: .level)
    }
    
    func getTrialEndDateAsString() -> String {
        if let trialEndDate = self.trialEndDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, yyyy"
            return formatter.string(from: trialEndDate)
        }
        
        return ""
    }
}

extension Timestamp {
    func dateValue() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(seconds))
    }
}
