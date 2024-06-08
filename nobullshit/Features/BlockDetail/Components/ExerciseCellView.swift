//
//  ExerciseCellView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI

struct ExerciseCellView: View {
    var round: Round

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Title with repetitions and name
            if(round.exercise != nil) {
                Text("\(round.repetitions ?? 12)x \(round.exercise?.name ?? "")")
                    .font(.headline)
                    .bold()
                
                // Subtitle with description
                Text(round.exercise?.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // YouTube video
                if let url = URL(string: round.exercise?.instructionsUrl ?? "") {
                    YoutubeView(url: url)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                } else {
                    Text("Invalid video URL")
                        .foregroundColor(.red)
                }
            } else {
                HStack(content: {
                    Text("\(round.type.rawValue)")
                        .font(.headline)
                        .bold()
                    Text("\(round.countTo)s")
                        .font(.headline)
                        .bold()
                })
            }
        }
        .padding()
    }
}

#Preview {
    return ExerciseCellView(round: roundsSample[1])
}
