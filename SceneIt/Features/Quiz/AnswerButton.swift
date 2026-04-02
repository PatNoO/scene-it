import SwiftUI

struct AnswerButton: View {
    let index: Int
    let label: String
    let isCorrect: Bool
    let isSelected: Bool
    let showFeedback: Bool
    let onSelectAnswer: (Int) -> Void

    private let letters = ["A", "B", "C", "D"]
    private var letter: String { letters[index] }

    var background: Color {
        guard showFeedback else { return .clear }
        if isCorrect { return Theme.correctBg.opacity(0.5) }
        if isSelected { return Theme.wrongBg.opacity(0.5) }
        return .clear
    }

    var foreground: Color {
        guard showFeedback else { return Theme.text.opacity(0.85) }
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

    var badgeBackground: Color {
        guard showFeedback else { return Theme.primary }
        if isCorrect { return Theme.correctBg }
        if isSelected { return Theme.wrongBg }
        return Theme.primary.opacity(0.3)
    }

    var body: some View {
        Button {
            onSelectAnswer(index)
        } label: {
            HStack(spacing: 0) {

                if index % 2 == 0 {
                    // A och C — bokstav till vänster
                    badgeView
                    Text(label)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(foreground)
                        .lineLimit(3)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity)
                } else {
                    // B och D — bokstav till höger
                    Text(label)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(foreground)
                        .lineLimit(3)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity)
                    badgeView
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(background)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(border, lineWidth: 1)
        )
        .disabled(showFeedback)
    }

    private var badgeView: some View {
        Text(letter)
            .font(.system(size: 10, weight: .bold))
            .foregroundStyle(.white.opacity(0.85))
            .frame(width: 24)
            .frame(maxHeight: .infinity)
            .background(badgeBackground)
    }
}
