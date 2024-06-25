import SwiftUI

struct BlockEditCard: View {
    @Binding var block: BlockEdit
    
    let onClose: () -> Void
    
    @State var excerciseTextList: [String] = []

    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            HStack {
                Spacer()
                Button(action: onClose, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.red)
                        .font(.title)
                })
            }
            HStack(alignment: .bottom, spacing: nil, content: {
                Text(block.type.rawValue)
                    .bold()
                    .font(.title3)
                Spacer()
            })
            VStack(alignment: .center, spacing: 20, content: {
                switch (block.type) {
                case .AMRAP:
                    AmrapSetupView(work: $block.work, rounds: $block.rounds, rest: $block.rest, isForEditCard: true)
                case .EMOM:
                    EmomSetupView(work: $block.work, rounds: $block.rounds, rest: $block.rest, isForEditCard: true)
                case .FORTIME:
                    FortimeSetupView(work: $block.work, isForEditCard: true)
                case .TABATA:
                    TabataSetupView(work: $block.work, rounds: $block.rounds, rest: $block.rest, isForEditCard: true)
                }
                TextToChipView(list: $excerciseTextList)
            })
        })
        .padding(.all)
        .border(.gray)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.red, lineWidth: 4)
        )
    }
}

struct BlockEditCard_Previews: PreviewProvider {
    static var previews: some View {
        BlockEditCard(block: .constant(blockEditSampleAMRAP), onClose: {
            print("Close card")
        })
    }
}
