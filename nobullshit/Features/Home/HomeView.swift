//
//  HomeView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var vm: HomeViewModel
    
    @State private var showingOnboarding = true
    
    @State private var showingAuthView = false
    
    var body: some View {
        NavigationStack {
            TabView {
                TimerMenu(vm: TimerMenuViewModel(appState: appState))
                    .navigationTitle("Timers")
                    .tabItem {
                        Image(systemName: "timer")
                        Text("Timers")
                    }
                UserProfileView(vm: UserProfileViewModel(appState: appState))
                    .tabItem {
                        Image(systemName: "person")
                        Text("User Profile")
                    }
                PreferenceView(vm: PreferenceViewModel(appState: appState))
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Preferences")
                    }
            }
        
            .background(
                NavigationLink(
                    destination: AuthView(vm: AuthViewModel(appState: appState)).navigationBarBackButtonHidden(true),
                    isActive: Binding(
                        get: { !appState.isLoggedIn },
                        set: { newValue in appState.isLoggedIn = !newValue }
                    )
                ) {
                    EmptyView()
                }
            )
            .onAppear {
                vm.fetchPreferencesDefinition()
                vm.fetchAccountsDefinition()
            }
            .fullScreenCover(isPresented: $showingOnboarding, content: {
                OnboardingView.init()
                    .edgesIgnoringSafeArea(.all)
            })
        }
    }
}

struct TabContentView: View {
    let tabIndex: Int

    var body: some View {
        VStack {
            Spacer()
            Text("I am tab \(tabIndex)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

#Preview {
    let appState = AppState()
    let viewModel = HomeViewModel(appState: appState)
    return HomeView(vm: viewModel)
        .environmentObject(appState)
}
