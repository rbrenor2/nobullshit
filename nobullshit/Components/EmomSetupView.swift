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
    
    let isForEditCard: Bool?
    
    init(work: Binding<Int>, rounds: Binding<Int>, rest: Binding<Int>, isForEditCard: Bool? = nil) {
        self._work = work
        self._rounds = rounds
        self._rest = rest
        self.isForEditCard = isForEditCard != nil ? isForEditCard : false
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            VStack(alignment: .trailing, spacing: 20, content: {
                Text("EVERY")
                    .font( isForEditCard! ? .title3 : .largeTitle)
                    .bold()
                Text("WORK FOR")
                    .font( isForEditCard! ? .title3 : .largeTitle)
                    .bold()
                Text("AND REST")
                    .font( isForEditCard! ? .title3 : .largeTitle)
                    .bold()
            })
            VStack(alignment: .center, spacing: 10, content: {
                Menu {
                    Picker(selection: $work) {
                        ForEach(1...30, id: \.self) { value in
                            Text(String(value))
                                .tag(value)
                                .font( isForEditCard! ? .title : .largeTitle)
                        }
                    } label: {}
                        .pickerStyle(.palette)
                } label: {
                    Text(String($work.wrappedValue))
                        .font( isForEditCard! ? .title : .largeTitle)
                        .foregroundStyle(.red)
                        .bold()
                }
                Menu {
                    Picker(selection: $work) {
                        ForEach(1...30, id: \.self) { value in
                            Text(String(value))
                                .tag(value)
                                .font( isForEditCard! ? .title : .largeTitle)
                        }
                    } label: {}
                        .pickerStyle(.palette)
                } label: {
                    Text(String($work.wrappedValue))
                        .font( isForEditCard! ? .title : .largeTitle)
                        .foregroundStyle(.red)
                        .bold()
                }
                Menu {
                    Picker(selection: $work) {
                        ForEach(Array(stride(from: 0, to: 65, by: 5)), id: \.self) { value in
                            Text(String(value))
                                .tag(value)
                                .font( isForEditCard! ? .title : .largeTitle)
                        }
                    } label: {}
                        .pickerStyle(.palette)
                } label: {
                    Text(String($work.wrappedValue))
                        .font( isForEditCard! ? .title : .largeTitle)
                        .foregroundStyle(.red)
                        .bold()
                }
            })
            VStack(alignment: .leading, spacing: 20, content: {
                Text("SECONDS")
                    .font( isForEditCard! ? .title3 : .largeTitle)
                    .bold()
                Text("ROUNDS")
                    .font( isForEditCard! ? .title3 : .largeTitle)
                    .bold()
                Text("SECONDS")
                    .font( isForEditCard! ? .title3 : .largeTitle)
                    .bold()
            })
        })
    }
}

#Preview {
    EmomSetupView(work: .constant(20), rounds: .constant(23), rest: .constant(30))
}
