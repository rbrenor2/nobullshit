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
    @Published var rest: Int = 0
    @Published var rounds: Int = 5
    @Published var countType: CountType = .FORTIME

    init(appState: AppState) {
        self.appState = appState
    }
    
    func getRounds() -> [Round] {
        var roundList = [Round(type: .PREPARE, countTo: 10)]
        
        for _ in 0...rounds {
            let workRound = Round(type: .WORK, countTo: getWorkSecondsFromType(countTo: work, countType: countType))
            roundList.append(workRound)
            
            if (rest != 0) {
                let restRound = Round(type: .REST, countTo: rest)
                roundList.append(restRound)
            }
        }
        
        return roundList
    }
    
    private func getWorkSecondsFromType(countTo: Int, countType: CountType) -> Int {
        switch countType {
        case .AMRAP:
            return countTo*60
        case .EMOM:
            return countTo*60
        default:
            return countTo
        }
    }
}
