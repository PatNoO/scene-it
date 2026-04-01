import Combine
import Foundation

class QuizViewModel: ObservableObject {
    @Published var state = QuizViewState()

    private var questions: [Question] = []
    private let category: Category
    private let onFinished: (Int, Int, Category) -> Void

    init(category: Category, onFinished: @escaping (Int, Int, Category) -> Void) {
        self.category = category
        self.onFinished = onFinished
        questions = QuestionStore.shared.questions(for: category)
        showQuestion(at: 0)
        state.onSelectAnswer = { [weak self] index in
            self?.selectAnswer(index)
        }
        state.onNextQuestion = { [weak self] in
            self?.nextQuestion()
        }
    }

    private func selectAnswer(_ index: Int) {
        guard state.selectedIndex == nil else { return }
        state.selectedIndex = index
        if questions[state.currentIndex].correctAnswer == index {
            state.score += 1
        }
    }

    private func nextQuestion() {
        state.currentIndex += 1
        state.selectedIndex = nil
        guard state.currentIndex < questions.count else {
            onFinished(state.score, state.total, category)
            return
        }
        showQuestion(at: state.currentIndex)
    }

    private func showQuestion(at index: Int) {
        guard index < questions.count else { return }
        let q = questions[index]
        state.question = q.question
        state.options = q.options
        state.correctAnswerIndex = q.correctAnswer
        state.progress = Double(index + 1) / Double(state.total)
    }
}
