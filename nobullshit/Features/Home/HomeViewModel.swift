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

    @Published var something: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func fetchPreferencesDefinition() {
        appState.isLoading = true
        
        PreferenceService.shared.getPreferencesDefinitions()
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
        
        AccountService.shared.getAccountsDefinition()
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
