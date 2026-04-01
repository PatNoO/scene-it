import Combine
import Foundation
 
class StartViewModel: ObservableObject {
 
    @Published var state = StartViewState()
 
    init(onStart: @escaping (Category) -> Void) {
        state.onSelectCategory = { [weak self] category in
            self?.state.selectedCategory = category
        }
        state.onStart = { [weak self] in
            guard let category = self?.state.selectedCategory else { return }
            onStart(category)
        }
    }
}
