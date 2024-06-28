//
//  MenuView.swift
//  nobullshit
//
//  Created by Breno R R on 15/06/2024.
//

import SwiftUI

struct TimerMenu: View {
    @EnvironmentObject var appState: AppState
    @StateObject var vm: TimerMenuViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink {
                        CreateBlockoutView(vm: CreateBlockoutViewModel())
                            .environmentObject(appState)
                    } label: {
                        TimerOptionView(title: "BLOCKOUT", color: .red, iconName: "crown.fill")
                    }
                }.padding(.bottom, 70)
                TimerMenuOptionView(countType: .AMRAP, rounds: vm.getRounds()) {
                    AmrapSetupView(work: $vm.work, rounds: $vm.rounds, rest: $vm.rest)
                }
                TimerMenuOptionView(countType: .FORTIME, rounds: vm.getRounds()) {
                    FortimeSetupView(work: $vm.work)
                }
                TimerMenuOptionView(countType: .EMOM, rounds: vm.getRounds()) {
                    EmomSetupView(work: $vm.work, rounds: $vm.rounds, rest: $vm.rest)
                }
                TimerMenuOptionView(countType: .TABATA, rounds: vm.getRounds()) {
                    TabataSetupView(work: $vm.work, rounds: $vm.rounds, rest: $vm.rest)
                }
            }
        }
        
    }
}

struct StartButtonView: View {
    let rounds: [Round]
    let countType: CountType
    
    var body: some View {
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
    }
}

#Preview {
    let appState = AppState()
    let viewModel = TimerMenuViewModel(appState: appState)
    return TimerMenu(vm: viewModel)
        .environmentObject(appState)
}
