//
//  ContentView.swift
//  nobullshit
//
//  Created by Breno R R on 30/05/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    
    var body: some View {
        AuthView(vm: AuthViewModel(appState: appState))
            .environmentObject(appState)
    }
}

#Preview {
    ContentView()
}
