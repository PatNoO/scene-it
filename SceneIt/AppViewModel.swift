import Combine
import Foundation

enum AppScreen {
    case start
    case quiz(category: Category)
    case result(score: Int, total: Int, category: Category)
}

@MainActor
class AppViewModel: ObservableObject {

    @Published var screen: AppScreen = .start

    private(set) lazy var startViewModel = StartViewModel(onStart: startQuiz)
    private(set) var quizViewModel: QuizViewModel?

    func startQuiz(category: Category) {
        quizViewModel = QuizViewModel(category: category, onFinished: showResult)
        screen = .quiz(category: category)
    }

    func showResult(score: Int, total: Int, category: Category) {
        screen = .result(score: score, total: total, category: category)
    }

    func restart() {
        screen = .start
    }
}
