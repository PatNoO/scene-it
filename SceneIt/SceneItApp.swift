import SwiftUI
 
@main
struct SceneItApp: App {
 
    @StateObject private var appViewModel = AppViewModel()
 
    var body: some Scene {
        WindowGroup {
            switch appViewModel.screen {
            case .start:
                StartView()
 
            case .quiz(let category):
                QuizView()
 
            case .result(let score, let total, let category):
                ResultView()
            }
        }
    }
}
