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
    
    func createWorkout(completion: @escaping ()->Void) {
        
//        let workout = Workout(name: self.name, blocks: self.blocks, createdAt: Date())
//        
//        // Cloudkit call
//        var blockRecords: [CKRecord] = []
//        
//        workout.blocks!.forEach { block in
//            let record = CKRecord(recordType: "Block")
//            record.setValuesForKeys(["id": block.id?.uuidString ?? UUID().uuidString, "type": block.type.rawValue, "excercises": block.excercises, "work": block.work, "rounds": block.rounds, "rest": block.rest])
//            
//            blockRecords.append(record)
//        }
//        
//        let workoutRecord = CKRecord(recordType: "Workout")
//
//        workoutRecord.setValuesForKeys(["name":workout.name ?? "", "totalTime": workout.getTotalTime(), "description": workout.getDescription(), "blocks": blockRecords.map({ blockRecord in
//            CKRecord.Reference(recordID: blockRecord.recordID, action: .none)
//        })])
//         
//        CloudkitRepository.shared.privateDatabase.save(workoutRecord) { [unowned self] record, error in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            
//            CloudkitRepository.shared.privateDatabase.modifyRecords(saving: blockRecords, deleting: []) { [unowned self] res in
//                print("Blocks saved successfully!")
//                self.showSnackbar = true
//                self.snackbarText = "You can now start a new workout attempt"
//                self.snackbarTitle = "Workout created!"
//                completion()
//            }
//        }
    }
    
    func generateRandomWorkoutName() -> String {
        return "Snivens Ultra"
    }
}
