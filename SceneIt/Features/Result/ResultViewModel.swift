import Combine
import Foundation

@MainActor
final class ResultViewModel: ObservableObject {

    @Published private(set) var state: ResultViewState

    private let score: Int
    private let totalQuestions: Int
    private let category: Category

    init(score: Int, totalQuestions: Int, category: Category) {
        self.score = score
        self.totalQuestions = totalQuestions
        self.category = category
        self.state = ResultViewState(
            score: score,
            totalQuestions: totalQuestions,
            category: category
        )
    }
}
