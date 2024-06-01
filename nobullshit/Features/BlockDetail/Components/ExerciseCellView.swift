//
//  ExerciseCellView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI

struct ExerciseCellView: View {
    var blockExercise: BlockExercise

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Title with repetitions and name
            Text("\(blockExercise.repetitions) x \(blockExercise.exercise.name)")
                .font(.headline)
                .bold()
            
            // Subtitle with description
            Text(blockExercise.exercise.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // YouTube video
            if let url = URL(string: blockExercise.exercise.instructionsUrl) {
                YoutubeView(url: url)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } else {
                Text("Invalid video URL")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

#Preview {
    let blockExercise = BlockExercise(id: "ASOIDJ", exercise: Exercise(id: "1232", description: "Great exercise for chest", difficulty: "INTERMEDIARY", instructionsUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4", name: "Pushups"), timeInSeconds: 0, repetitions: 10)
    
    return ExerciseCellView(blockExercise: blockExercise)
}
