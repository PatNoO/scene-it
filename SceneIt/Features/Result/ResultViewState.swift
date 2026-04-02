import SwiftUI

struct ResultViewState {

    let score: Int
    let totalQuestions: Int
    let category: Category

    var title: String {
        String(localized: "result_title")
    }

    var subtitle: String {
        String(localized: "app_tagline")
    }

    var playAgainButton: String {
        String(localized: "play_again_button")
    }
    
    var onRestart: () -> Void = { }

    var scoreOfLable: String {
        String(localized: "score_of")
    }

    var categoryName: String {
        switch category {
        case .comedy: return String(localized: "category_comedy")
        case .thriller: return String(localized: "category_thriller")
        case .drama: return String(localized: "category_drama")
        case .action: return String(localized: "category_action")
        }
    }

    var scoreText: String {
        "\(score)"
    }

    var totalText: String {
        "\(scoreOfLable) \(totalQuestions)"
    }

    var progress: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(score) / Double(totalQuestions)
    }

    var resultHeadLine: String {
        switch score {
        case 10: return String(localized: "result_perfect")
        case 7...9: return String(localized: "result_great")
        case 4...6: return String(localized: "result_ok")
        default: return String(localized: "result_keep_trying")
        }
    }

    var resultBody: String {
        switch score {
         case 10:    return String(localized: "result_body_perfect")
         case 7...9: return String(localized: "result_body_great")
         case 4...6: return String(localized: "result_body_ok")
         default:    return String(localized: "result_body_keep_trying")
         }
    }

    var progressColor: Color {
        switch score {
        case 10: return Theme.highlight
        case 7...9: return Theme.primary
        case 4...6: return Theme.accent
        default: return Theme.accent.opacity(0.5)
        }
    }

    static var preview: ResultViewState {
        ResultViewState(
            score: 8,
            totalQuestions: 10,
            category: .comedy
        )
    }

}
