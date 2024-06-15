import SwiftUI

struct AddBlockButton: View {
    let type: CountType
    let action: () -> Void
    
    var body: some View {
        HStack(alignment: .bottom, spacing: nil, content: {
            Button(action: action, label: {
                ZStack(alignment: .center, content: {
                    HStack(alignment: .center, spacing: 5, content: {
                        Image(systemName: "plus")
                        Text(type.rawValue)
                            .font(.body)
                            .bold()
                    })
                }).frame(width: 120, height: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10, antialiased: true)
                    .padding(.all)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous), style: FillStyle())
            })
        })
    }
}

struct AddBlockButton_Previews: PreviewProvider {
    static var previews: some View {
        AddBlockButton(type: .FORTIME) {
            print("Add button!")
        }
    }
}
