import SwiftUI

// ====== Colors ======

struct Theme {

    static let background = Color("SceneIt Colors/Background")
    static let surface = Color("SceneIt Colors/Surface")
    static let primary = Color("SceneIt Colors/Primary")
    static let accent = Color("SceneIt Colors/Accent")
    static let highlight = Color("SceneIt Colors/Highlight")
    static let text = Color("SceneIt Colors/Text")

    // ====== Feedback colors ======

    static let correctBg = Color("SceneIt Colors/CorrectBackground")
    static let correctText = Color("SceneIt Colors/CorrectText")
    static let wrongBg = Color("SceneIt Colors/WrongBackground")
    static let wrongText = Color("SceneIt Colors/WrongText")

    // ====== Gradients ======

    static let buttonGradient = LinearGradient(
        colors: [
            Color("SceneIt Colors/Primary"), Color("SceneIt Colors/Accent"),
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
    static let bgGradient = LinearGradient(
        colors: [
            Color("SceneIt Colors/Surface"), Color("SceneIt Colors/Background"),
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    static let progressGradient = LinearGradient(
        colors: [
            Color("SceneIt Colors/Primary"), Color("SceneIt Colors/Highlight"),
        ],
        startPoint: .leading,
        endPoint: .trailing
    )

}

// ====== Hex color helper ======

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let v = Int(hex, radix: 16) ?? 0
        self.init(
            red: Double((v >> 16) & 0xFF) / 255,
            green: Double((v >> 8) & 0xFF) / 255,
            blue: Double(v & 0xFF) / 255,
            opacity: opacity
        )
    }
}
