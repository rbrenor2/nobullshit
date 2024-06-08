import SwiftUI
import AVFoundation

class SpeechService {
    static let shared = SpeechService()
    private var synthesizer = AVSpeechSynthesizer()
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: String(text))
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
}
