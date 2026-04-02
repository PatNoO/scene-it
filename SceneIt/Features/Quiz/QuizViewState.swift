import Foundation

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
