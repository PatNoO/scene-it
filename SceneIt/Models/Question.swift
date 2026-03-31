//
//  Question.swift
//  SceneIt
//
//  Created by Patrik Noordh on 2026-03-31.
//

import Foundation

struct Question: Identifiable, Codable {
    var id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: Int
    let category: Category
    
    var correctAnswerText: String? {
        options[correctAnswer]
    }
    
    private enum CodingKeys: String, CodingKey {
        case question, options, correctAnswer, category
    }
}
