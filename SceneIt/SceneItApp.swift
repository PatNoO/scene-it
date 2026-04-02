import SwiftUI

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
