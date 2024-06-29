import SwiftUI
import CloudKit

@MainActor
class CreateBlockoutViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var blocks: [Block] = []
    
    @Published var showSnackbar: Bool = false
    @Published var snackbarTitle: String = ""
    @Published var snackbarText: String = ""
            
    func addBlock(_ type: CountType) {
        blocks.append(Block(type: type, excercises: []))
    }
    
    func removeBlock(id: UUID) {
        blocks.removeAll { block in
            UUID(uuidString: block.id!) == id
        }
    }
    
    func createBlockout() {
        
    }
    
    func generateRandomWorkoutName() -> String {
        return "Snivens Ultra"
    }
    
    private func getRoundsFromBlockEdit(_ block: Block) -> [Round] {
        switch block.type {
        case .AMRAP:
            return getRoundsFromBlock(block)
        case .EMOM:
            return getRoundsFromBlock(block)
        case .FORTIME:
            return getFortimeRoundsFromBlock(block)
        case .TABATA:
            return getRoundsFromBlock(block)
        }
    }
    
    private func getRoundsFromBlock(_ block: Block) -> [Round] {
        // The work duration is the duration for each round, and the rest is after each round
        var rounds: [Round] = []
        
        rounds.append(Round(type: .PREPARE, countTo: 10))
        
        for _ in 0...block.rounds {
            rounds.append(Round(type: .WORK, countTo: block.work))
            rounds.append(Round(type: .REST, countTo: block.rest))
        }
        
        return rounds
    }
    
    private func getFortimeRoundsFromBlock(_ block: Block) -> [Round] {
        // The work duration is the duration for each round, and the rest is after each round
        var rounds: [Round] = []
        
        rounds.append(Round(type: .PREPARE, countTo: 10))
        
        rounds.append(Round(type: .WORK, countTo: block.work))
        
        return rounds
    }
}
