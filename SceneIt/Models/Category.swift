import Foundation

enum Category: String, Codable, CaseIterable {
    case comedy = "Komedi"
    case thriller = "Thriller"
    case drama = "Drama"
    case action = "Action"

    var displayName: String {
        switch self {
        case .comedy: return String(localized: "category_comedy")
        case .thriller: return String(localized: "category_thriller")
            case .drama:    return String(localized: "category_drama")
            case .action:   return String(localized: "category_action")
        }
    }

    var series: [String] {
        switch self {
        case .comedy: return ["Solsidan", "Bonusfamiljen", "Svensson Svensson"]
        case .thriller: return ["Johan Falk", "Beck", "Veronika"]
        case .drama: return ["Störst av allt", "Knutby", "Tunna blå linjen"]
        case .action: return ["Snabba Cash", "Gåsmamman", "Jägarna"]
        }
    }
}

struct CategoryItem: Identifiable {
 
    let id = UUID()
 
    let category: Category
 
    let icon: String
 
    let suffix: String
 
    static var all: [CategoryItem] = [
        CategoryItem(category: .thriller, icon: "🔪", suffix: String(localized: "questions_suffix")),
        CategoryItem(category: .drama,    icon: "🎭", suffix: String(localized: "questions_suffix")),
        CategoryItem(category: .comedy,   icon: "😂", suffix: String(localized: "questions_suffix")),
        CategoryItem(category: .action,   icon: "💥", suffix: String(localized: "questions_suffix"))
    ]
 
    var displayName: String { category.displayName }
 
    var countLabel: String { "10 \(suffix)" }
 
}
 
