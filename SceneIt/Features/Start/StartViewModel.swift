import Combine
import Foundation

@MainActor
final class StartViewModel: ObservableObject {
    
    @Published private(set) var state = StartViewState()
    
    var onStart: ((Category) -> Void)?
    
    init() {
        state.onSelectCategory = { [weak self] category in
            self?.state.selectedCategory = category
        }
        state.onStart = { [weak self] in
            guard let category = self?.state.selectedCategory else { return }
            self?.onStart?(category)
        }
    }
}
