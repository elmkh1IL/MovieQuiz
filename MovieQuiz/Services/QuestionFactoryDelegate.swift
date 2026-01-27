//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by xxx on 04.01.2026.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}

