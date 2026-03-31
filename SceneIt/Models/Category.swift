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
