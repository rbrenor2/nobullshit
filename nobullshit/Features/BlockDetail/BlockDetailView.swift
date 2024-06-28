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
            List(block.rounds) { round in
                ExerciseCellView(round: round)
                    .listRowInsets(EdgeInsets())
            }
            NavigationLink(destination: TimerView(rounds: block.rounds, countType: block.countType)) {
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
        }.navigationTitle(block.countType.rawValue)
    }
}

#Preview {
    print(blockSample)
    return BlockDetailView(block: blockSample)
}
