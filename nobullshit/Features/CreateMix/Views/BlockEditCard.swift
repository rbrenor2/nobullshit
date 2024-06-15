import SwiftUI

struct BlockEditCard: View {
    @Binding var block: BlockEdit
    
    let onClose: () -> Void
    
    @State var excerciseTextList: [String] = []

    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            HStack(alignment: .bottom, spacing: nil, content: {
                Text(block.type.rawValue)
                    .bold()
                    .font(.title3)
                Spacer()
                Button(action: onClose, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.title)
                })
            })
            VStack(alignment: .center, spacing: 20, content: {
                switch (block.type) {
                case .AMRAP:
                    AmrapForm(work: $block.work)
                case .EMOM:
                    EmomForm(work: $block.work, rest: $block.rest, rounds: $block.rounds)
                case .FORTIME:
                    ForTimeForm(work: $block.work)
                case .TABATA:
                    TabataForm(work: $block.work, rest: $block.rest, rounds: $block.rounds)
                }
//                TextToChipView(list: $excerciseTextList)
                HStack(alignment: .center, spacing: nil, content: {
                    TextField("20x Mountain climbers", text: $block.excercises, axis: .vertical)
                        .foregroundColor(.black)
                }).padding()
                    .background(.white)
                    .cornerRadius(5, antialiased: true)
            })
        }).padding(.all)
            .background(.red)
            .cornerRadius(10, antialiased: true)
    }
}

struct BlockEditCard_Previews: PreviewProvider {
    static var previews: some View {
        BlockEditCard(block: .constant(blockEditSampleAMRAP), onClose: {
            print("Close card")
        })
    }
}
