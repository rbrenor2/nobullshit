import SwiftUI

struct TimerView: View {
    let rounds: [Round]
    let countType: CountType
    
    @State var excercises: String = ""
    @State var isFirstTime = true
    @State var isPaused: Bool = true
    @State var isDone: Bool = false
    @State var elapsedTime: Int = 0
    @State var startTime = Date.now
    @State var roundCount = 0
    @State var currentRound: Round
    @State var timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    @State var counter: Int = 0
    @State var countTo: Int = 0
    
    init(rounds: [Round], countType: CountType) {
        self.rounds = rounds
        self.countType = countType
        self.currentRound = rounds[0]
    }
    
    private func getWorkRounds() -> Int {
        return rounds.filter { round in
            round.type == .WORK
        }.count
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            HStack(alignment: .center, spacing: nil, content: {
                if currentRound.type == .PREPARE {
                    Text("PREPARE")
                        .font(.largeTitle)
                        .bold()
                } else {
                    Text("\(roundCount) of \(getWorkRounds())")
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
                Text(countType.rawValue)
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
                if roundCount == getWorkRounds() {
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
        TimerView(rounds: [Round(type: .WORK, countTo: 5), Round(type: .REST, countTo: 10)], countType: .AMRAP)
    }
}


