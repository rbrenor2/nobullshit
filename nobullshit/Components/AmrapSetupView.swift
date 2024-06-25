//
//  AmrapSetupView.swift
//  nobullshit
//
//  Created by Breno R R on 16/06/2024.
//

import SwiftUI

struct AmrapSetupView: View {
    @Binding var work: Int
    @Binding var rounds: Int
    @Binding var rest: Int
    
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
                Text("FOR")
                    .font(isForEditCard! ? .title3 : .title)
                    .bold()
                Text("REPEAT")
                    .font(isForEditCard! ? .title3 : .title)
                    .bold()
                Text("REST")
                    .font(isForEditCard! ? .title3 : .title)
                    .bold()
            })
            VStack(alignment: .center, spacing: 14, content: {
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
                    Picker(selection: $rounds) {
                        ForEach(Array(stride(from: 0, to: 60, by: 5)), id: \.self) { value in
                            Text(String(value))
                                .tag(value)
                                .font( isForEditCard! ? .title : .largeTitle)
                        }
                    } label: {}
                        .pickerStyle(.palette)
                } label: {
                    Text(String($rounds.wrappedValue))
                        .font( isForEditCard! ? .title : .largeTitle)
                        .foregroundStyle(.red)
                        .bold()
                }
                Menu {
                    Picker(selection: $rest) {
                        ForEach(Array(stride(from: 0, to: 60, by: 5)), id: \.self) { value in
                            Text(String(value))
                                .tag(value)
                                .font( isForEditCard! ? .title : .largeTitle)
                        }
                    } label: {}
                        .pickerStyle(.palette)
                } label: {
                    Text(String($rest.wrappedValue))
                        .font( isForEditCard! ? .title : .largeTitle)
                        .foregroundStyle(.red)
                        .bold()
                }
            })
            VStack(alignment: .leading, spacing: 20, content: {
                Text("MINUTES")
                    .font(isForEditCard! ? .title3 : .title)
                    .bold()
                Text("TIMES")
                    .font(isForEditCard! ? .title3 : .title)
                    .bold()
                Text("SECONDS")
                    .font(isForEditCard! ? .title3 : .title)
                    .bold()
            })
        })
    }
}

#Preview {
    AmrapSetupView(work: .constant(30), rounds: .constant(5), rest: .constant(30))
}
