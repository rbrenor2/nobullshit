//
//  TimerMenuOptionView.swift
//  nobullshit
//
//  Created by Breno R R on 25/06/2024.
//

import SwiftUI

struct TimerMenuOptionView<SetupView>: View where SetupView : View {
    let setupView: SetupView
    let countType: CountType
    let rounds: [Round]

    init(countType: CountType, rounds: [Round], @ViewBuilder _ setupView: () -> SetupView) {
        self.setupView = setupView()
        self.countType = countType
        self.rounds = rounds
    }
    
    var body: some View {
        NavigationLink {
            setupView
            NavigationLink(destination: TimerView(rounds: rounds, countType: countType)) {
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
        } label: {
            TimerOptionView(title: countType.rawValue, color: .blue)
        }
    }
}

//#Preview {
////    TimerMenuOptionView(setupView: AmrapSetupView(work: .constant(10), rounds: .constant(5), rest: .constant(20)), countType: .AMRAP)
//    TimerMenuOptionView(setupView: {
//        AnyView(AmrapSetupView(work: .constant(10), rounds: .constant(20), rest: .constant(23)))
//    }, countType: .AMRAP, rounds: [])
//}
