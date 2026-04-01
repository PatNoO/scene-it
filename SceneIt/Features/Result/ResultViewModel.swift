import Combine
import Foundation

@MainActor
final class ResultViewModel: ObservableObject {

    @Published var state: ResultViewState

    init(score: Int, totalQuestions: Int, category: Category, onRestart: @escaping () -> Void) {
        self.state = ResultViewState(
            score: score,
            totalQuestions: totalQuestions,
            category: category
        )
        self.state.onRestart = onRestart
        
    }
    
}
