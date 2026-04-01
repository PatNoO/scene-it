import Foundation
 
struct StartViewState {
    var categories: [CategoryItem] = CategoryItem.all
    var questionCount: Int = 10
    var optionCount: Int = 4
    var selectedCategory: Category? = nil
 
    var appName: String { NSLocalizedString("app_name", comment: "") }
    var tagline: String { NSLocalizedString("app_tagline", comment: "") }
    var selectCategoryLabel: String { NSLocalizedString("select_category", comment: "") }
    var startButtonLabel: String { NSLocalizedString("start_button", comment: "") }
    var questionsLabel: String { NSLocalizedString("questions_count", comment: "") }
    var optionsLabel: String { NSLocalizedString("options_count", comment: "") }
    var isStartButtonEnabled: Bool { selectedCategory != nil }
 
    var onSelectCategory: (Category) -> Void = { _ in }
    var onStart: () -> Void = { }
 
    static var preview: StartViewState { StartViewState() }
}
