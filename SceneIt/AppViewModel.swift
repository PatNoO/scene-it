import Combine
import Foundation

s
enum AppScreen {
    case start
    case quiz(category: Category)
    case result(score: Int, total: Int, category: Category)
}


@MainActor
final class AppViewModel: ObservableObject {

    
    @Published var screen: AppScreen = .start

   
    @Published private(set) var startViewModel: StartViewModel
    @Published private(set) var quizViewModel: QuizViewModel?
    @Published private(set) var resultViewModel: ResultViewModel?

    init() {
        
        startViewModel = StartViewModel()
        startViewModel.onStart = { [weak self] category in
            self?.startQuiz(category: category)
        }
    }

    
    func startQuiz(category: Category) {
        quizViewModel = QuizViewModel(category: category, onFinished: showResult)
        screen = .quiz(category: category)
    }

    
    func showResult(score: Int, total: Int, category: Category) {
        resultViewModel = ResultViewModel(
            score: score,
            totalQuestions: total,
            category: category,
            onRestart: restart
        )
        screen = .result(score: score, total: total, category: category)
    }

    
    func restart() {
        resultViewModel = nil
        quizViewModel = nil
        screen = .start
    }
}
