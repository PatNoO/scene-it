import Combine
import SwiftUI
 
class StartViewModel: ObservableObject {
    @Published var state = StartViewState()
 
    init() {
        state.onSelectCategory = { [weak self] category in
            self?.state.selectedCategory = category
        }
        state.onStart = { [weak self] in
            guard self?.state.selectedCategory != nil else { return }
            self?.state.showQuiz = true
        }
    }
}
