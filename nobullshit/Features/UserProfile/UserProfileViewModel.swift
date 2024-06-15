//
//  UserProfileView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//
import SwiftUI
import FirebaseAuth
import Combine

@MainActor
class UserProfileViewModel: ObservableObject {
    var appState: AppState

    @Published var userAvatarUrl: String = ""
    @Published var name: String = "John Doe"
    @Published var email: String = "test@test.com"
    @Published var accountName: String? = nil
    @Published var accountDescription: String? = nil

    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func logout() {
        AuthService.shared.logout()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.appState.setInitialState()
                    break
                case .failure(let error):
                    print("Error logging out: \(error.localizedDescription)")
                }
            }, receiveValue: { success in
                if success {
                    self.appState.isLoggedIn = false
                }
            })
            .store(in: &cancellables)
    }
    
    func loadUserProfile() {
        if appState.userProfile == nil && appState.user?.email != nil {
            guard let email = appState.user!.email else { return }
            self.fetchUserProfile(email: email)
        }
    }
    
    private func fetchUserProfile(email: String) {
        appState.isLoading = true
        
        UserProfileService.shared.getUserProfile(email: email)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.appState.isLoading = false
                switch completion {
                case .failure(let error):
                    self.appState.error = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { userProfile in
                self.appState.userProfile = userProfile
                print(userProfile)
                self.setAccountDefinition()
            }
            .store(in: &cancellables)
    }

    func setAccountDefinition() {
        guard let account = appState.accountsDefinition?.first(where: { $0.id == appState.userProfile?.accountType }) else { return }
                
        accountName = account.displayName
        accountDescription = account.description
    }
}

