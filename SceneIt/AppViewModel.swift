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
 
    func startQuiz(category: Category) {
        screen = .quiz(category: category)
    }
 
    func showResult(score: Int, total: Int, category: Category) {
        screen = .result(score: score, total: total, category: category)
    }
 
    func restart() {
        screen = .start
    }
}

