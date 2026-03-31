import SwiftUI

struct QuizViewState {
    var question: String = ""
    var options: [String] = []
    var progress: Double = 0.0
    var score: Int = 0
    var currentIndex: Int = 0
    var total: Int = 10
    var showFeedback: Bool = false

    var questionLabel: String {
        String(format: NSLocalizedString("question_label", comment: ""), currentIndex + 1, total)
    }

    var scoreLabel: String {
        "★ " + String(format: NSLocalizedString("score_label", comment: ""), score)
    }

    var nextButtonLabel: String {
        NSLocalizedString("next_button", comment: "")
    }

    var nextButtonOpacity: Double { showFeedback ? 1.0 : 0.0 }
    var nextButtonDisabled: Bool { !showFeedback }

    func buttonBackground(for index: Int) -> Color { Theme.surface }
    func buttonText(for index: Int) -> Color { .white }
    func buttonBorder(for index: Int) -> Color { Theme.highlight.opacity(0.3) }
}
