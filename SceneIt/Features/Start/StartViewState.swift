import SwiftUI
 
struct StartViewState {

    var categories: [CategoryItem] = CategoryItem.all

    var questionCount: Int = 10

    var optionCount: Int = 4

    var showQuiz: Bool = false

    var selectedCategory: Category? = nil
 
    var appName: String { NSLocalizedString("app_name", comment: "") }

    var tagline: String { NSLocalizedString("app_tagline", comment: "") }

    var selectCategoryLabel: String { NSLocalizedString("select_category", comment: "") }

    var startButtonLabel: String { NSLocalizedString("start_button", comment: "") }

    var questionsLabel: String { NSLocalizedString("questions_count", comment: "") }

    var optionsLabel: String { NSLocalizedString("options_count", comment: "") }
 
    var onSelectCategory: (Category) -> Void = { _ in }

    var onStart: () -> Void = { }
 
    static var preview: StartViewState {

        StartViewState()

    }

}
 
struct CategoryItem: Identifiable {

    let id = UUID()

    let category: Category

    let icon: String

    let suffix: String
 
    static var all: [CategoryItem] = [

        CategoryItem(category: .thriller, icon: "🔪", suffix: NSLocalizedString("questions_suffix", comment: "")),

        CategoryItem(category: .drama,    icon: "🎭", suffix: NSLocalizedString("questions_suffix", comment: "")),

        CategoryItem(category: .komedi,   icon: "😂", suffix: NSLocalizedString("questions_suffix", comment: "")),

        CategoryItem(category: .action,   icon: "💥", suffix: NSLocalizedString("questions_suffix", comment: ""))

    ]
 
    var displayName: String { category.displayName }

    var countLabel: String { "10 \(suffix)" }

}
 
