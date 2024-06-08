//
//  ExerciseView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI

struct ExerciseView: View {
    var round: Round

    var body: some View {
        HStack {
            if(round.type == RoundType.WORK) {
                Text(String(round.repetitions ?? 10))
                    .bold()
                Text(round.exercise?.name ?? "")
            } else {
                Text(String(round.type.rawValue))
                    .bold()
                Text("\(round.countTo)s")
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    return ExerciseView(round: roundsSample[0])
}
