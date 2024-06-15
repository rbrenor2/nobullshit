import SwiftUI

//enum RoundType {
//    case WORK
//    case PREPARE
//    case REST
//    case DONE
//}
//
//struct Round {
//    let type: RoundType
//    let countTo: Int
//}

struct TimerView: View {
    @State var rounds: [Round] = []
    @State var excercises: String = ""
    @State var blockType: CountType = .FORTIME
    @State var isFirstTime = true
    @State var isPaused: Bool = true
    @State var isDone: Bool = false
    @State var elapsedTime: Int = 0
    @State var startTime = Date.now
    @State var roundCount = 0
    @State var currentRound: Round = Round(type: .PREPARE, countTo: 10)
    @State var timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    @State var counter: Int = 0
    @State var countTo: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            HStack(alignment: .center, spacing: nil, content: {
                if currentRound.type == .PREPARE {
                    Text("PREPARE")
                        .font(.largeTitle)
                        .bold()
                } else {
                    Text("\(roundCount) of \(rounds.count)")
                        .font(.largeTitle)
                        .bold()
                }
                
            })
            ZStack{
                ProgressTrackView()
                ProgressBarView(counter: counter, countTo: currentRound.countTo)
                if isFirstTime  {
                    Text("START")
                        .font(.largeTitle)
                        .bold()
                        .onTapGesture {
                            start()
                        }    
                } else {
                    if !isDone {
                        if isPaused {
                            Text("PAUSED")
                                .font(.largeTitle)
                                .bold()
                                .onTapGesture {
                                    toggleTimer()
                                }    
                        } else {
                            ClockView(counter: counter, countTo: currentRound.countTo)
                                .onTapGesture {
                                    if isFirstTime {
                                        isFirstTime = false
                                    }
                                    toggleTimer()
                                }    
                        }    
                    } else {
                        Text("DONE")
                            .font(.largeTitle)
                            .bold()
                    }  
                }
            }
            Spacer()
            VStack(alignment: .center, spacing: 20, content: {
                Text(blockType.rawValue)
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    VStack(alignment: .center, spacing: 20, content: {
                        ForEach(excercises.split(separator: "\n"), id: \.self) { excercise in
                            Text(excercise)
                                .font(.title2)
                        }    
                    })
                }
            })
            Spacer()
        }.onReceive(timer, perform: { time in
            onEverySecond()
            elapsedTime = Int(time.timeIntervalSince(startTime))
        })
    }
    
    func onEverySecond() {
        if(!isPaused && !isDone) {
            if counter < countTo {
                counter += 1
            }
            
            if counter == countTo {
                if roundCount == rounds.count {
                    finishWorkout()
                } else {
                    nextRound()
                }
            }
        }
    }
    
    func finishWorkout() {
        timer.upstream.connect().cancel()
        isDone = true
        counter = currentRound.countTo
        SpeechService.shared.speak(text: "Done")
    }
    
    func nextRound() {
        currentRound = rounds[roundCount]
        countTo = currentRound.countTo
        counter = 0
        roundCount += 1
        SpeechService.shared.speak(text: "Go")
    }
    
    func start() {
        roundCount = 0
        counter = 0
        isPaused = false
        isFirstTime = false 
        countTo = currentRound.countTo
        SpeechService.shared.speak(text: "Prepare")
    }
    
    func toggleTimer() {
        isPaused = !isPaused
        if isFirstTime {
            isFirstTime = false
        }
    }
    
    func isTimeDone() -> Bool {
        return counter == countTo
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(rounds: [Round(type: .WORK, countTo: 5), Round(type: .REST, countTo: 10)], excercises: "40x Burpees\n20x Jumping Jacks", blockType: .AMRAP)
    }
}


