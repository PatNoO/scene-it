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
        if index == correctAnswerIndex { return Theme.correctBg.opacity(Opacity.half) }
        if index == selectedIndex { return Theme.wrongBg.opacity(Opacity.half) }
        return .clear
    }

    func foregroundColor(for index: Int) -> Color {
        guard showFeedback else { return Theme.text.opacity(Opacity.high) }
        if index == correctAnswerIndex { return Theme.correctText }
        if index == selectedIndex { return Theme.wrongText }
        return .white.opacity(Opacity.medium)
    }

    func borderColor(for index: Int) -> Color {
        guard showFeedback else { return Theme.highlight.opacity(Opacity.disabled) }
        if index == correctAnswerIndex { return Theme.correctText.opacity(Opacity.medium) }
        if index == selectedIndex { return Theme.wrongText.opacity(Opacity.medium) }
        return Theme.highlight.opacity(Opacity.ghost)
    }

    func badgeBackground(for index: Int) -> Color {
        guard showFeedback else { return Theme.primary }
        if index == correctAnswerIndex { return Theme.correctBg }
        if index == selectedIndex { return Theme.wrongBg }
        return Theme.primary.opacity(Opacity.disabled)
    }
}
