//
//  TimerMenuViewModel.swift
//  nobullshit
//
//  Created by Breno R R on 16/06/2024.
//

import Foundation

@MainActor
class TimerMenuViewModel: ObservableObject {
    var appState: AppState
    
    @Published var work: Int = 1
    @Published var rest: Int = 10
    @Published var rounds: Int = 5

    init(appState: AppState) {
        self.appState = appState
    }
}
