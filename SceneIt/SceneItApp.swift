import SwiftUI

@main
struct SceneItApp: App {

    @StateObject private var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            switch appViewModel.screen {
            case .start:
                StartView(state: appViewModel.startViewModel.state)

            case .quiz:
                if let vm = appViewModel.quizViewModel {
                    QuizView(state: vm.state)
                }

            case .result(let score, let total, let category):
                ResultView(
                    state: ResultViewModel(
                        score: score,
                        totalQuestions: total,
                        category: category,
                        onRestart: appViewModel.restart
                    ).state
                )
            }
        }
    }
}
