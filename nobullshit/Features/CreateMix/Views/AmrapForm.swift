import SwiftUI
import Combine

struct AmrapForm: View {
    @Binding var work: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            VStack(alignment: .center, spacing: 10, content: {
                Text("FOR")
            })
            VStack(alignment: .center, spacing: 20, content: {
                Picker("", selection: $work) { 
                    ForEach(1...30, id: \.self) { number in
                        Text(String(number))
                    }
                }.background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            VStack(alignment: .center, spacing: 10, content: {
                Text("MINUTES")
            })
        })
    }
}

struct AmrapForm_Previews: PreviewProvider {
    static var previews: some View {
        AmrapForm(work: .constant(50))
    }
}
