import SwiftUI
// NOTE: This file contains intentional compiler errors.
// Waiting for StartViewModel and QuizViewModel to be updated
// with onStart and onFinished callbacks before this compiles.

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
