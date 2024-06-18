//
//  AmrapSetupView.swift
//  nobullshit
//
//  Created by Breno R R on 16/06/2024.
//

import SwiftUI

struct AmrapSetupView: View {
    @Binding var work: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            Text("FOR")
                .font(.title)
                .bold()
            VStack(alignment: .center, spacing: 20, content: {
                Menu {
                    Picker(selection: $work) {
                        ForEach(1...30, id: \.self) { value in
                            Text(String(value))
                                .tag(value)
                                .font(.largeTitle)
                        }
                    } label: {}
                } label: {
                    Text(String($work.wrappedValue))
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                        .bold()
                }
            })
            Text("MINUTES")
                .font(.title)
                .bold()
        })
        .navigationTitle("AMRAP")
    }
}

#Preview {
    AmrapSetupView(work: .constant(30))
}
