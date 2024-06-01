//
//  ExerciseView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI

struct ExerciseView: View {
    var exercise: BlockExercise

    var body: some View {
        HStack {
            Text(String(exercise.repetitions))
                .bold()
            Text(exercise.exercise.name)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
