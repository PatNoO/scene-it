import SwiftUI

struct AnswerButton: View {
    let index: Int
    let label: String
    let showFeedback: Bool
    let onSelectAnswer: (Int) -> Void

    private let letters = ["A", "B", "C", "D"]
    private var letter: String { letters[index] }

    let background: Color
    let foreground: Color
    let border: Color
    let badgeBackground: Color

    var body: some View {
        Button {
            onSelectAnswer(index)
        } label: {
            HStack(spacing: 0) {

                if index % 2 == 0 {
                    badgeView
                    Text(label)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(foreground)
                        .lineLimit(3)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity)
                } else {
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
