//
//  BlockDetailView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI

struct BlockDetailView: View {
    let block: Block
    
    var body: some View {
        VStack {
            List(block.exercises) { exercise in
                ExerciseCellView(blockExercise: exercise)
                    .listRowInsets(EdgeInsets())
            }
            // NavigationLink for the "Start" button
            NavigationLink(destination: TimerView()) {
                Text("Start")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding([.leading, .trailing, .top])
            }
        }.navigationTitle(block.countType)
        
    }
}

#Preview {
    let blockExercises = [
        BlockExercise(id: "ASOIDJ", exercise: Exercise(id: "1232", description: "Great exercise for chest", difficulty: "INTERMEDIARY", instructionsUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4", name: "Pushups"), timeInSeconds: 0, repetitions: 10),
        BlockExercise(id: "54fekj", exercise: Exercise(id: "24354", description: "Great exercise for chest", difficulty: "ADVANCED", instructionsUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4", name: "Pullups"), timeInSeconds: 0, repetitions: 5),
        BlockExercise(id: "tg45", exercise: Exercise(id: "24354", description: "Great exercise for chest", difficulty: "ADVANCED", instructionsUrl: "https://www.youtube.com/watch?v=eGo4IYlbE5g", name: "Pullups"), timeInSeconds: 0, repetitions: 5)
    ]
    
    let block = Block(id: "1231", countType: "AMRAP", rounds: 5, type: "Warmup", exercises: blockExercises)
    
    return BlockDetailView(block: block)
}
