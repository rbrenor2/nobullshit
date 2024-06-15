//
//  Blocks.swift
//  nobullshit
//
//  Created by Breno R R on 08/06/2024.
//

import Foundation

let exerciseSample = Exercise(id: "1232", description: "Great exercise for chest", level: .INTERMEDIARY, instructionsUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4", name: "Pushups")

let exerciseSample1 = Exercise(id: "2okmls", description: "Great exercise for back", level: .INTERMEDIARY, instructionsUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4", name: "Pullups")
let exerciseSample2 = Exercise(id: "2oijs0", description: "Great exercise for legs", level: .BEGINNER, instructionsUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4", name: "Squats")
let exerciseSample3 = Exercise(id: "jwoi02", description: "Great exercise for chest", level: .INTERMEDIARY, instructionsUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4", name: "Pushups")


let roundsSample = [Round(id: "2nu93uj", type: .PREPARE, countTo: 10), Round(id: "5f45t45t", type: .WORK, countTo: 60, exercise: exerciseSample, repetitions: 15), Round(id: "2nu233d93uj", type: .REST, countTo: 20), Round(id: "vrt4r54", type: .WORK, countTo: 60, exercise: exerciseSample), Round(id: "65h76hyt", type: .WORK, countTo: 60, exercise: exerciseSample1), Round(id: "23d2dwdd", type: .WORK, countTo: 60, exercise: exerciseSample2)]


let blockSample = Block(id: "1231", countType: .AMRAP, rounds: roundsSample)

let blockSample1 = Block(id: "4j938j89", countType: .FORTIME, rounds: roundsSample)
let blockSample2 = Block(id: "308h9dj0", countType: .EMOM, rounds: roundsSample)
let blockSample3 = Block(id: "3j09sjip", countType: .TABATA, rounds: roundsSample)

let blockEditSampleAMRAP = BlockEdit(type: .AMRAP)
let blockEditSampleFORTIME = BlockEdit(type: .FORTIME)
let blockEditSampleEMOM = BlockEdit(type: .EMOM)
let blockEditSampleTABATA = BlockEdit(type: .TABATA)


let blocksSample = [blockSample, blockSample1, blockSample2, blockSample3]
let blockoutSample = Blockout(id: "sij98asj", blocks: blocksSample)
