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

                StartView(viewModel: appViewModel.startViewModel)

            case .quiz:
                if let vm = appViewModel.quizViewModel {
                    QuizView(viewModel: vm)
                }

            case .result:
                if let vm = appViewModel.resultViewModel {
                    ResultView(viewModel: vm)
                }
            }
        }
    }
}
