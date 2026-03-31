import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var state = QuizViewState()

    private var questions: [Question] = []
    private var selectedIndex: Int? = nil

    func load(category: Category) {
        questions = QuestionStore.shared.questions(for: category)
        showQuestion(at: 0)
    }

    func selectAnswer(_ index: Int) {
        guard selectedIndex == nil else { return }
        selectedIndex = index
        state.showFeedback = true
        if questions[state.currentIndex].correctAnswer == index {
            state.score += 1
        }
    }

    func nextQuestion() {
        state.currentIndex += 1
        selectedIndex = nil
        state.showFeedback = false
        showQuestion(at: state.currentIndex)
    }

    private func showQuestion(at index: Int) {
        guard index < questions.count else { return }
        let q = questions[index]
        state.question = q.question
        state.options = q.options
        state.progress = Double(index + 1) / Double(state.total)
    }
}
