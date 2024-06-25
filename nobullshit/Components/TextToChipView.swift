import SwiftUI

struct TextToChipView: View {
    @Binding var list: [String]
    
    @State private var value: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            VStack(alignment: .center, spacing: 5, content: {
                ForEach(list, id: \.self) { item in
                    HStack(alignment: .center, spacing: 5, content: {
                        Text(item)
                            .lineLimit(1)
                            .fixedSize()
                            .font(.caption)
                        Button(action: {
                            self.list.removeAll { text in
                                item == text
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                                .font(.caption)
                        })
                    }).padding(10)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(60, antialiased: true)
                    
                }
            }).fixedSize(horizontal: true, vertical: false)
            HStack(alignment: .center, spacing: nil, content: {
                TextField("20x Mountain climbers", text: $value, axis: .vertical)
                    .foregroundColor(.black)
                    .onSubmit {
                        if($value.wrappedValue != "") {
                            self.list.append($value.wrappedValue)
                            $value.wrappedValue = ""   
                        }
                    }
            }).padding()
                .background(.white)
                .cornerRadius(5, antialiased: true)
            
        })    
    }
}

struct TextToChipView_Previews: PreviewProvider {
    static var previews: some View {
        TextToChipView(list: .constant(["40x burpees", "50x Mountain climbers"]))
    }
}
