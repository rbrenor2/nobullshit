//
//  BlockoutDetailView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI

struct BlockoutDetailView: View {
    var blockout: Blockout
    
    var body: some View {
        NavigationView {
            List(blockout.blocks) { block in
                NavigationLink(destination: BlockDetailView(block: block)) {
                    BlockoutView(block: block)
                        .listRowInsets(EdgeInsets())
                }
            }
            .navigationTitle("Blockout Of The Day")
        }
    }
}

#Preview {
    let blockExercises = [
        BlockExercise(id: "ASOIDJ", exercise: Exercise(id: "1232", description: "Great exercise for chest", difficulty: "INTERMEDIARY", instructionsUrl: "https://www.youtube.com/watch?v=eGo4IYlbE5g", name: "Pushups"), timeInSeconds: 0, repetitions: 10),
        BlockExercise(id: "54fekj", exercise: Exercise(id: "24354", description: "Great exercise for chest", difficulty: "ADVANCED", instructionsUrl: "https://www.youtube.com/watch?v=eGo4IYlbE5g", name: "Pullups"), timeInSeconds: 0, repetitions: 5),
        BlockExercise(id: "tg45", exercise: Exercise(id: "24354", description: "Great exercise for chest", difficulty: "ADVANCED", instructionsUrl: "https://www.youtube.com/watch?v=eGo4IYlbE5g", name: "Pullups"), timeInSeconds: 0, repetitions: 5)
    ]
    let blocks = [
       Block(id: "1231", countType: "AMRAP", rounds: 5, type: "Warmup", exercises: blockExercises),
       Block(id: "rj9454", countType: "FOR TIME", rounds: 5, type: "challenge", exercises: blockExercises),
       Block(id: "54546d3", countType: "FOR TIME", rounds: 5, type: "challenge", exercises: blockExercises)
    ]
    let blockout = Blockout(blocks: blocks)
    
    return BlockoutDetailView(blockout: blockout)
}
