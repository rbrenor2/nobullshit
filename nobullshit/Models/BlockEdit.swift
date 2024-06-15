//
//  BlockEdit.swift
//  nobullshit
//
//  Created by Breno R R on 15/06/2024.
//
import SwiftUI

struct BlockEdit: Identifiable, Equatable {
    let id: UUID?
    let type: CountType
    var excercises: String
    let attempts: [Attempt]?
    var work: Int
    var rounds: Int
    var rest: Int
    
    init(id: UUID? = nil, type: CountType, excercises: String? = nil, attempts: [Attempt]? = nil, work: Int? = nil, rounds: Int? = nil, rest: Int? = nil) {
        self.id = id ?? UUID()
        self.type = type
        self.excercises = excercises ?? ""
        self.attempts = attempts ?? nil
        self.work = work ?? 20
        self.rounds = rounds ?? 3
        self.rest = rest ?? 10
    }
    
    func getBlockDescription() -> String {
        return excercises.split(separator: "\n\n").joined(separator: "\n\n")
    }
    
    static func == (lhs: BlockEdit, rhs: BlockEdit) -> Bool {
        lhs.id == rhs.id
    }
}
