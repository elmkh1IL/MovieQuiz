//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by xxx on 06.01.2026.
//

import Foundation

final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case gamesCount
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
        case totalCorrectAnswer
        case totalQuestionsAsked
    }
    
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
                return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
            storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
        }
    }
    
    var totalCorrectAnswers: Int {
        get {
            storage.integer(forKey: Keys.totalCorrectAnswer.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.totalCorrectAnswer.rawValue)
        }
    }
    
    var totalQuestionsAsked: Int {
        get {
            storage.integer(forKey: Keys.totalQuestionsAsked.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.totalQuestionsAsked.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        totalQuestionsAsked == 0 ? 0 : Double(totalCorrectAnswers) / Double(totalQuestionsAsked) * 100
    }
    
    func store(correct count: Int, total amount: Int) {
   
        totalCorrectAnswers += count
        totalQuestionsAsked += amount
        
        gamesCount += 1
        
        let currentGame = GameResult(correct: count, total: amount, date: Date())
        
        if currentGame.accuracy > bestGame.accuracy {
        bestGame = currentGame
        }
    }
    
    
}
