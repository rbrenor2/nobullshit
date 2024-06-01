//
//  HomeView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI
import FirebaseAuth
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    var appState: AppState
    let authService: AuthService = AuthService()
    let preferenceService: PreferenceService = PreferenceService()
    let accountService: AccountService = AccountService()

    @Published var something: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func logout() {
        authService.logout()
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
    
    func fetchPreferencesDefinition() {
        appState.isLoading = true
        
        preferenceService.getPreferencesDefinitions()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.appState.isLoading = false
                switch completion {
                case .failure(let error):
                    self.appState.error = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { preferences in
                self.appState.preferencesDefinition = preferences
                print(preferences)
                
            }
            .store(in: &cancellables)
    }
    
    func fetchAccountsDefinition() {
        appState.isLoading = true
        
        accountService.getAccountsDefinition()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.appState.isLoading = false
                switch completion {
                case .failure(let error):
                    self.appState.error = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { definitions in
                self.appState.accountsDefinition = definitions
            }
            .store(in: &cancellables)
    }
}
