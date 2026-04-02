import Foundation

struct Question: Identifiable, Codable {
    var id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: Int
    let category: Category
    let series: String

    var correctAnswerText: String? {
        options[correctAnswer]
    }

    private enum CodingKeys: String, CodingKey {
        case question, options, correctAnswer, category, series
    }
}
