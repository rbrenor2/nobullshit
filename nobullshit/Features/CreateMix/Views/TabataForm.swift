import SwiftUI
import Combine

struct TabataForm: View {
    @Binding var work: Int
    @Binding var rest: Int
    @Binding var rounds: Int
    
    var body: some View { 
        HStack(alignment: .center, spacing: 20, content: {
            VStack(alignment: .trailing, spacing: 20, content: {
                Text("FOR")
                Text("WORK")
                Text("REST")
            })
            VStack(alignment: .center, spacing: 10, content: {
                Picker("", selection: $rounds) { 
                    ForEach(1...30, id: \.self) { number in
                        Text(String(number))
                    }
                }.background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Picker("", selection: $work) { 
                    ForEach(Array(stride(from: 0, to: 60, by: 5)), id: \.self) { number in
                        Text(String(number))
                    }
                }.background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Picker("", selection: $rest) { 
                    ForEach(Array(stride(from: 0, to: 60, by: 5)), id: \.self) { number in
                        Text(String(number))
                    }
                }.background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            VStack(alignment: .leading, spacing: 20, content: {
                Text("ROUNDS")
                Text("SECONDS")
                Text("SECONDS")
            })
        })
//        VStack(alignment: .center, spacing: 5, content: {
//            HStack(alignment: .center, spacing: 5, content: {
//                Text("FOR")
//                Picker("", selection: $rounds) { 
//                    ForEach(1...30, id: \.self) { number in
//                        Text(String(number))
//                    }
//                }.background(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 12))
//                Text("ROUNDS")
//            })
//            HStack(alignment: .center, spacing: 5, content: {
//                Text("WORK")
//                Picker("", selection: $work) { 
//                    ForEach(Array(stride(from: 0, to: 60, by: 5)), id: \.self) { number in
//                        Text(String(number))
//                    }
//                }.background(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 12))
//                Text("SECONDS")
//            })
//            HStack(alignment: .center, spacing: 5, content: {
//                Text("REST")
//                Picker("", selection: $rest) { 
//                    ForEach(Array(stride(from: 0, to: 60, by: 5)), id: \.self) { number in
//                        Text(String(number))
//                    }
//                }.background(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 12))
//                Text("SECONDS")
//            })
//        })
    }
}

struct TabataForm_Previews: PreviewProvider {
    static var previews: some View {
        TabataForm(work: .constant(30), rest: .constant(10), rounds: .constant(5))
    }
}
