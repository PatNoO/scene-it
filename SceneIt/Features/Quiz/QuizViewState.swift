import SwiftUI

struct QuizViewState {
    var question: String = ""
    var options: [String] = []
    var progress: Double = 0.0
    var score: Int = 0
    var currentIndex: Int = 0
    var total: Int = 10
    var correctAnswerIndex: Int = 0

    var questionLabel: String {
        String(format: NSLocalizedString("question_label", comment: ""), currentIndex + 1, total)
    }

    var scoreLabel: String {
        "★ " + String(format: NSLocalizedString("score_label", comment: ""), score)
    }

    var nextButtonLabel: String {
        NSLocalizedString("next_button", comment: "")
    }
    
    static var preview: QuizViewState {
        var state = QuizViewState()
        state.question = "Vilket år hade serien Solsidan premiär på TV4?"
        state.options = ["2008", "2010", "2012", "2014"]
        state.correctAnswerIndex = 2
        state.progress = 0.4
        state.score = 3
        state.currentIndex = 3
        return state
    }

}

