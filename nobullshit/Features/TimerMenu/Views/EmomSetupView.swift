//
//  EmomSetupView.swift
//  nobullshit
//
//  Created by Breno R R on 16/06/2024.
//

import SwiftUI

struct EmomSetupView: View {
    @Binding var work: Int
    @Binding var rest: Int
    @Binding var rounds: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            VStack(alignment: .trailing, spacing: 20, content: {
                Text("EVERY")
                    .font(.title)
                    .bold()
                Text("WORK FOR")
                    .font(.title)
                    .bold()
                Text("AND REST")
                    .font(.title)
                    .bold()
            })
            VStack(alignment: .center, spacing: 10, content: {
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
                Menu {
                    Picker(selection: $work) {
                        ForEach(Array(stride(from: 0, to: 65, by: 5)), id: \.self) { value in
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
            VStack(alignment: .leading, spacing: 20, content: {
                Text("SECONDS")
                    .font(.title)
                    .bold()
                Text("ROUNDS")
                    .font(.title)
                    .bold()
                Text("SECONDS")
                    .font(.title)
                    .bold()
            })
        }).navigationTitle("EMOM")
    }
}

#Preview {
    EmomSetupView(work: .constant(20), rest: .constant(30), rounds: .constant(23))
}
