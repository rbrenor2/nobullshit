//
//  MenuView.swift
//  nobullshit
//
//  Created by Breno R R on 15/06/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(content: {
            MenuButtonView(title: "AMRAP", color: .green)
            MenuButtonView(title: "FOR TIME", color: .blue)
            MenuButtonView(title: "EMOM", color: .purple)
            MenuButtonView(title: "TABATA", color: .red)
        })
    }
}

struct MenuButtonView: View {
    let title: String
    let color: Color
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text(title)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .tint(color)
        .frame(width: 200, height: 50)
    }
}

#Preview {
    MenuView()
}
