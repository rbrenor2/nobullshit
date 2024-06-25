//
//  TimerOptionView.swift
//  nobullshit
//
//  Created by Breno R R on 16/06/2024.
//

import SwiftUI

struct TimerOptionView: View {
    let title: String
    let color: Color
    let iconName: String?
    
    init(title: String, color: Color, iconName: String? = nil) {
        self.title = title
        self.color = color
        self.iconName = iconName
    }
    
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.vertical)
            if (iconName != nil) {
                Image(systemName: iconName!)
                    .foregroundStyle(.yellow)
            }
        }
        .frame(maxWidth: .infinity)
        .background(color)
    }
}

#Preview {
    TimerOptionView(title: "AMRAP", color: .brown, iconName: "plus")
}

