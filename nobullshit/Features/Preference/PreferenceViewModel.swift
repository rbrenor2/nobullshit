//
//  PreferencesView+Observer.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI
import Combine

@MainActor
class PreferenceViewModel: ObservableObject {
    var appState: AppState
    
    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func loadPreferences() {
        if appState.preferences.count == 0 && appState.user?.email != nil {
            self.fetchPreferencesFromUser()
        }
    }
    
    func fetchPreferencesFromUser() {
        appState.isLoading = true
        
        PreferenceService.shared.getPreferencesForUser(email: appState.user?.email ?? "")
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
                self.appState.preferences = preferences.compactMap { preference in
                    guard let info = self.appState.preferencesDefinition?.first(where: { $0.id == preference.id }) else {
                        return nil
                    }

                    var newPreference = preference
                    newPreference.displayName = info.displayName
                    newPreference.type = info.type

                    return newPreference
                }
                print(preferences)
                
            }
            .store(in: &cancellables)
    }
}
