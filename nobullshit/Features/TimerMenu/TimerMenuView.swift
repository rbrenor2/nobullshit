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
                NavigationLink {
                    AmrapSetupView(work: $vm.work, rounds: $vm.rounds, rest: $vm.rest)
                    StartButtonView(rounds: roundsSample)
                } label: {
                    TimerOptionView(title: "AMRAP", color: .blue)
                }
                NavigationLink {
                    FortimeSetupView(work: $vm.work)
                    StartButtonView(rounds: roundsSample)
                } label: {
                    TimerOptionView(title: "FOR TIME", color: .brown)
                }
                NavigationLink {
                    EmomSetupView(work: $vm.work, rounds: $vm.rounds, rest: $vm.rest)
                    StartButtonView(rounds: roundsSample)
                } label: {
                    TimerOptionView(title: "EMOM", color: .green)
                }
                NavigationLink {
                    TabataSetupView(work: $vm.work, rounds: $vm.rounds, rest: $vm.rest)
                    StartButtonView(rounds: roundsSample)
                } label: {
                    TimerOptionView(title: "TABATA", color: .red)
                }
            }
        }
        
    }
}

struct StartButtonView: View {
    let rounds: [Round]
    
    var body: some View {
        NavigationLink(destination: TimerView(rounds: rounds)) {
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
