import SwiftUI
import CloudKit

@MainActor
class CreateBlockoutViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var blocks: [BlockEdit] = []
    
    @Published var showSnackbar: Bool = false
    @Published var snackbarTitle: String = ""
    @Published var snackbarText: String = ""
            
    func addBlock(_ type: CountType) {
        blocks.append(BlockEdit(type: type, excercises: ""))
    }
    
    func removeBlock(id: UUID) {
        blocks.removeAll { block in
            block.id == id
        }
    }
    
    func createBlockout() {
        // Create a Block for each BlockEdit
        let blocks = blocks.map { blockEdit in
            let rounds = getRoundsFromBlockEdit(blockEdit)
            return Block(id: nil, countType: blockEdit.type, rounds: rounds)
        }
        
        // Create a blockout
    }
    
    func generateRandomWorkoutName() -> String {
        return "Snivens Ultra"
    }
    
    private func getRoundsFromBlockEdit(_ blockEdit: BlockEdit) -> [Round] {
        switch blockEdit.type {
        case .AMRAP:
            return getRoundsFromBlock(blockEdit)
        case .EMOM:
            return getRoundsFromBlock(blockEdit)
        case .FORTIME:
            return getFortimeRoundsFromBlock(blockEdit)
        case .TABATA:
            return getRoundsFromBlock(blockEdit)
        }
    }
    
    private func getRoundsFromBlock(_ blockEdit: BlockEdit) -> [Round] {
        // The work duration is the duration for each round, and the rest is after each round
        var rounds: [Round] = []
        
        rounds.append(Round(type: .PREPARE, countTo: 10))
        
        for _ in 0...blockEdit.rounds {
            rounds.append(Round(type: .WORK, countTo: blockEdit.work))
            rounds.append(Round(type: .REST, countTo: blockEdit.rest))
        }
        
        return rounds
    }
    
    private func getFortimeRoundsFromBlock(_ blockEdit: BlockEdit) -> [Round] {
        // The work duration is the duration for each round, and the rest is after each round
        var rounds: [Round] = []
        
        rounds.append(Round(type: .PREPARE, countTo: 10))
        
        rounds.append(Round(type: .WORK, countTo: blockEdit.work))
        
        return rounds
    }
}
