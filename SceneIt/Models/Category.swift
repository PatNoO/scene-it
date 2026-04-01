import Foundation

enum Category: String, Codable, CaseIterable {
    case komedi = "Komedi"
    case thriller = "Thrille"
    case drama = "Drama"
    case action = "Action"

    var displayName: String { rawValue }

    var series: [String] {
        switch self {
        case .komedi: return ["Solsidan", "Bonusfamiljen", "Svensson Svensson"]
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
 
        CategoryItem(category: .thriller, icon: "🔪", suffix: NSLocalizedString("questions_suffix", comment: "")),
 
        CategoryItem(category: .drama,    icon: "🎭", suffix: NSLocalizedString("questions_suffix", comment: "")),
 
        CategoryItem(category: .komedi,   icon: "😂", suffix: NSLocalizedString("questions_suffix", comment: "")),
 
        CategoryItem(category: .action,   icon: "💥", suffix: NSLocalizedString("questions_suffix", comment: ""))
 
    ]
 
    var displayName: String { category.displayName }
 
    var countLabel: String { "10 \(suffix)" }
 
}
 
