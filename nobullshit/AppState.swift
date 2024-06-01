//
//  AppState.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI
import FirebaseAuth

@MainActor
class AppState: ObservableObject {
    // General
    @Published var isLoading: Bool = false
    @Published var error: String? = nil

    // Auth
    @Published var user: User? = nil
    @Published var isLoggedIn: Bool = false
    
    // Account
    @Published var accountsDefinition: [AccountDefinition]? = nil
    
    // Preferences
    @Published var preferences: [Preference] = []
    @Published var preferencesDefinition: [PreferenceDefinition]? = nil

    // User Profile
    @Published var userProfile: UserProfile? = nil
    
    init() {
        self.setInitialState()
    }
    
    func setInitialState() {
        self.isLoading = false
        self.error = nil
        self.user = nil
        self.isLoggedIn = false
        self.preferences = []
        self.preferencesDefinition = nil
        self.userProfile = nil
        self.accountsDefinition = nil
    }
}


