
import Foundation

final class HighScoreStore {
    static let shared = HighScoreStore()
    private let defaults = UserDefaults.standard

    private init() {}

    func highScore(for category: Category) -> Int? {
        let key = "highscore_\(category.rawValue)"
        guard defaults.object(forKey: key) != nil else { return nil }
        return defaults.integer(forKey: key)
    }

    func save(score: Int, for category: Category) {
        let key = "highscore_\(category.rawValue)"
        let current = highScore(for: category) ?? 0
        if score > current {
            defaults.set(score, forKey: key)
        }
    }
}
