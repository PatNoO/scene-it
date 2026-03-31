import Foundation

final class QuestionStore {

    static let shared = QuestionStore()

    private let allQuestions: [Question]

    private init() {
        guard
            let url = Bundle.main.url(
                forResource: "questions",
                withExtension: "json"
            ),
            let data = try? Data(contentsOf: url)
        else {
            assertionFailure("question.json saknas i app bundle")
            allQuestions = []
            return
        }

        do {
            allQuestions = try JSONDecoder().decode([Question].self, from: data)
        } catch {
            assertionFailure("Kunde inte avkoda question.json: \(error)")
            allQuestions = []
        }
    }

    func questions(for category: Category) -> [Question] {
        allQuestions
            .filter { $0.category == category }
            .shuffled()
            .prefix(10)
            .map { $0 }
    }

}
