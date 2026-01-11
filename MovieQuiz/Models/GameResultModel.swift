//
//  GameResultModel.swift
//  MovieQuiz
//
//  Created by xxx on 06.01.2026.
//

import Foundation

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    
    var accuracy: Double {
        total == 0 ? 0 : Double(correct) / Double(total) * 100
    }
    func isBetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
}
