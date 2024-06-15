import SwiftUI

struct ProgressTrackView: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().stroke(Color.black, lineWidth: 15)
            )
    }
}

struct ProgressTrackView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTrackView()
    }
}
