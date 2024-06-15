import SwiftUI
import Combine

struct EmomForm: View {
    @Binding var work: Int
    @Binding var rest: Int
    @Binding var rounds: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            VStack(alignment: .trailing, spacing: 20, content: {
                Text("EVERY")
                Text("WORK FOR")
                Text("AND REST")
            })
            VStack(alignment: .center, spacing: 10, content: {
                Picker("", selection: $work) { 
                    ForEach(1...30, id: \.self) { number in
                        Text(String(number))
                    }
                }.background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Picker("", selection: $rounds) { 
                    ForEach(1...30, id: \.self) { number in
                        Text(String(number))
                    }
                }.background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Picker("", selection: $rest) { 
                    ForEach(Array(stride(from: 0, to: 65, by: 5)), id: \.self) { number in
                        Text(String(number))
                    }
                }.background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            VStack(alignment: .leading, spacing: 20, content: {
                Text("SECONDS")
                Text("ROUNDS")
                Text("SECONDS")
            })
        })
    }
}

struct EmomForm_Previews: PreviewProvider {
    static var previews: some View {
        EmomForm(work: .constant(20), rest: .constant(30), rounds: .constant(23))
    }
}
