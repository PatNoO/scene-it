import SwiftUI

struct QuizViewState {
    var question: String = ""
    var options: [String] = []
    var progress: Double = 0.0
    var score: Int = 0
    var currentIndex: Int = 0
    var total: Int = 10
    var correctAnswerIndex: Int = 0
    var selectedIndex: Int? = nil
    var categoryName: String = ""
    var seriesName: String = ""

    var questionLabel: String {
        String(format: String(localized: "question_label"), currentIndex + 1, total)
    }

    var scoreLabel: String {
        "★ " + String(format: String(localized: "score_label"), score)
    }

    var nextButtonLabel: String {
        String(localized: "next_button")
    }

    var isNextButtonVisible: Bool { selectedIndex != nil }
    var isNextButtonDisabled: Bool { selectedIndex == nil }
    var showFeedback: Bool { selectedIndex != nil }

    func isSelected(_ index: Int) -> Bool { selectedIndex == index }

    var onSelectAnswer: (Int) -> Void = { _ in }
    var onNextQuestion: () -> Void = { }
    
    func backgroundColor(for index: Int) -> Color {
        guard showFeedback else { return .clear }
        if index == correctAnswerIndex { return Theme.correctBg.opacity(0.5) }
        if index == selectedIndex { return Theme.wrongBg.opacity(0.5) }
        return .clear
    }
    
    func foregroundColor(for index: Int) -> Color {
        guard showFeedback else { return Theme.text.opacity(0.85) }
        if index == correctAnswerIndex { return Theme.correctText }
        if index == selectedIndex { return Theme.wrongText }
        return .white.opacity(0.4)
    }
    
    func borderColor(for index: Int) -> Color {
        guard showFeedback else { return Theme.highlight.opacity(0.3) }
        if index == correctAnswerIndex { return Theme.correctText.opacity(0.4) }
        if index == selectedIndex { return Theme.wrongText.opacity(0.4) }
        return Theme.highlight.opacity(0.1)
    }

    func badgeBackground(for index: Int) -> Color {
        guard showFeedback else { return Theme.primary }
        if index == correctAnswerIndex { return Theme.correctBg }
        if index == selectedIndex { return Theme.wrongBg }
        return Theme.primary.opacity(0.3)
    }

    static var preview: QuizViewState {
        var state = QuizViewState()
        state.question = "Vilket år hade serien Solsidan premiär på TV4?"
        state.options = ["2008", "2010", "2012", "2014"]
        state.correctAnswerIndex = 2
        state.progress = 0.4
        state.score = 3
        state.currentIndex = 3
        state.categoryName = "Svenska Serier"
        return state
    }
}
