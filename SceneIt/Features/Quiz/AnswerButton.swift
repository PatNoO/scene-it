import SwiftUI

struct AnswerButton: View {
    let index: Int
    let label: String
    let isCorrect: Bool
    @Binding var selectedIndex: Int?
    let onSelectAnswer: (Int) -> Void

    private var isSelected: Bool { selectedIndex == index }
    private var showFeedback: Bool { selectedIndex != nil }

    var background: Color {
        guard showFeedback else { return Theme.surface }
        if isCorrect { return Theme.correctBg }
        if isSelected { return Theme.wrongBg }
        return Theme.surface
    }

    var foreground: Color {
        guard showFeedback else { return .white }
        if isCorrect { return Theme.correctText }
        if isSelected { return Theme.wrongText }
        return .white.opacity(0.4)
    }

    var border: Color {
        guard showFeedback else { return Theme.highlight.opacity(0.3) }
        if isCorrect { return Theme.correctText.opacity(0.4) }
        if isSelected { return Theme.wrongText.opacity(0.4) }
        return Theme.highlight.opacity(0.1)
    }

    var body: some View {
        Button(label) {
            selectedIndex = index
            onSelectAnswer(index)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(background)
        .foregroundStyle(foreground)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(border, lineWidth: 1)
        )
        .disabled(showFeedback)
    }
}
