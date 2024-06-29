//
//  BlockoutView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI

struct BlockoutView: View {
    var block: Block

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(block.type.rawValue)
                .font(.title)
                .bold()
                .padding(.vertical, 10)
//            ForEach(block.rounds) { round in
//                ExerciseView(round: round)
//            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}

#Preview {
    
}
