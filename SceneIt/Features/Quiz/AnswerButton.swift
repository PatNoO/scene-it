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
        guard showFeedback else { return .clear}
        if isCorrect { return Theme.correctBg }
        if isSelected { return Theme.wrongBg }
        return .clear
    }

    var foreground: Color {
        guard showFeedback else {return Theme.text.opacity(0.85)}
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
        Button {
            onSelectAnswer(index)
        } label: {
            HStack(spacing: 6) {
                Text(letter)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(foreground.opacity(0.8))
                    .frame(width: 18, height: 18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(foreground.opacity(0.5), lineWidth: 1)
                    )
                Text(label)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(foreground)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        }
        .background(background)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(border, lineWidth: 1)
        )
        .disabled(showFeedback)
    }
}
