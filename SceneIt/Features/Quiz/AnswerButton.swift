import SwiftUI

struct AnswerButton: View {
    let index: Int
    let label: String
    let showFeedback: Bool
    let onSelectAnswer: (Int) -> Void

    let background: Color
    let foreground: Color
    let border: Color
    let badgeBackground: Color

    private let letters = ["A", "B", "C", "D"]
    private var letter: String { letters[index] }

    var body: some View {
        Button {
            onSelectAnswer(index)
        } label: {
            HStack(spacing: Spacing.none) {

                if index % 2 == 0 {
                    badgeView
                    Text(label)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(foreground)
                        .lineLimit(Quiz.answerLineLimit)
                        .padding(.horizontal, Spacing.small)
                        .frame(maxWidth: .infinity)
                } else {
                    Text(label)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(foreground)
                        .lineLimit(Quiz.answerLineLimit)
                        .padding(.horizontal, Spacing.small)
                        .frame(maxWidth: .infinity)
                    badgeView
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(background)
        .cornerRadius(Layout.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Layout.cornerRadius)
                .stroke(border, lineWidth: Layout.borderWidth)
        )
        .disabled(showFeedback)
    }

    private var badgeView: some View {
        Text(letter)
            .font(.system(size: FontSize.xSmall, weight: .bold))
            .foregroundStyle(.white.opacity(Opacity.high))
            .frame(width: Layout.badgeWidth)
            .frame(maxHeight: .infinity)
            .background(badgeBackground)
    }
}
