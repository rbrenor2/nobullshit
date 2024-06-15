import SwiftUI
import AVFoundation

struct ClockView: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.custom("Avenir Next", size: 60))
                .fontWeight(.black)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        if(currentTime <= 5 && currentTime != 0) {
            SpeechService.shared.speak(text: String(currentTime))
        }
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }   
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(counter: 200, countTo: 1000)
    }
}
