import SwiftUI

struct StartViewState {
    
    var categories: [CategoryItem] = CategoryItem.all
    var questionCount: Int = 10
    var optionCount: Int = 4
    var selectedCategory: Category? = nil
    var appName: String { String(localized: "app_name") }
    var tagline: String { String(localized: "app_tagline") }
    var selectCategoryLabel: String { String(localized: "select_category") }
    var startButtonLabel: String { String(localized: "start_button") }
    var questionsLabel: String { String(localized: "questions_count") }
    var optionsLabel: String { String(localized: "options_count") }
    var isStartButtonEnabled: Bool { selectedCategory != nil }
    
    func selectionBorder(for category: Category) -> Color {
        selectedCategory == category ? Theme.highlight.opacity(Opacity.strong) : .clear
    }
    func selectionBorderWidth(for category: Category) -> CGFloat {
        selectedCategory == category ? Layout.borderWidthSelected : Spacing.none
    }
    func glowRadius(for category: Category) -> CGFloat {
        selectedCategory == category ? Layout.glowRadiusSelected : Spacing.none
    }
    
    var onSelectCategory: (Category) -> Void = { _ in }
    var onStart: () -> Void = { }
}
