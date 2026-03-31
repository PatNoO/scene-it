import SwiftUI

// ====== Colors ======

struct Theme {

    static let background  = Color("Background")
    static let surface     = Color("Surface")
    static let primary     = Color("Primary")
    static let accent      = Color("Accent")
    static let highlight   = Color("Highlight")

    // ====== Feedback colors ======
    
    static let correctBg   = Color(hex: "1A6B35")
    static let correctText = Color(hex: "7EFFA8")
    static let wrongBg     = Color(hex: "6B1A1A")
    static let wrongText   = Color(hex: "FFAAAA")

    // ====== Gradients ======
    
    static let buttonGradient = LinearGradient(
        colors: [Color("Primary"), Color("Accent")],
        startPoint: .leading,
        endPoint: .trailing
    )
    static let bgGradient = LinearGradient(
        colors: [Color("Surface"), Color("Background")],
        startPoint: .top,
        endPoint: .bottom
    )
    static let progressGradient = LinearGradient(
        colors: [Color("Primary"), Color("Highlight")],
        startPoint: .leading,
        endPoint: .trailing
    )

    // ====== Glow ======
    
    static func glow(radius: CGFloat = 10) -> some ViewModifier {
        GlowModifier(color: Color("Highlight"), radius: radius)
    }
}

// ====== Glow modifier ======

struct GlowModifier: ViewModifier {
    let color: Color
    let radius: CGFloat
    func body(content: Content) -> some View {
        content.shadow(color: color.opacity(0.4), radius: radius)
    }
}

// ====== View extension ======

extension View {
    func glowEffect(radius: CGFloat = 10) -> some View {
        modifier(GlowModifier(color: Color("Highlight"), radius: radius))
    }
}

// ====== Hex color helper ======

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let v = Int(hex, radix: 16) ?? 0
        self.init(
            red:   Double((v >> 16) & 0xFF) / 255,
            green: Double((v >> 8)  & 0xFF) / 255,
            blue:  Double(v         & 0xFF) / 255,
            opacity: opacity
        )
    }
}
