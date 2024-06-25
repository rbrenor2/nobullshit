//
//  FortimeSetupView.swift
//  nobullshit
//
//  Created by Breno R R on 16/06/2024.
//

import SwiftUI

struct FortimeSetupView: View {
    @Binding var work: Int
    
    let isForEditCard: Bool?
    
    init(work: Binding<Int>, isForEditCard: Bool? = nil) {
        self._work = work
        self.isForEditCard = isForEditCard != nil ? isForEditCard : false
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            Text("FOR")
                .font(isForEditCard! ? .title3 : .title)
                .bold()
            VStack(alignment: .center, spacing: 20, content: {
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
            })
            Text("MINUTES")
                .font(isForEditCard! ? .title3 : .title)
                .bold()
        })
    }
}

#Preview {
    FortimeSetupView(work: .constant(20))
}
