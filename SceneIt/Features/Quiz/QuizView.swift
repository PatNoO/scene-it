import SwiftUI

struct QuizView: View {
    let state: QuizViewState

    var body: some View {
        ZStack {
            Theme.bgGradient
                .ignoresSafeArea()

            VStack(spacing: 16) {
                HStack {
                    Text(state.questionLabel)
                        .font(.caption)
                        .foregroundStyle(Theme.highlight.opacity(0.6))
                    Spacer()
                    Text(state.scoreLabel)
                        .font(.caption)
                        .foregroundStyle(Theme.highlight)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Theme.surface)
                        .cornerRadius(12)
                }

                ProgressView(value: state.progress)
                    .tint(Theme.highlight)

                Text(state.question)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Theme.surface)
                    .clipShape(OctagonShape())
                    .overlay(
                        OctagonShape()
                            .stroke(Theme.highlight, lineWidth: 1.5)
                    )

                Spacer()

                ForEach(Array(state.options.enumerated()), id: \.offset) { index, option in
                    AnswerButton(
                        index: index,
                        label: option,
                        isCorrect: index == state.correctAnswerIndex,
                        isSelected: state.isSelected(index),
                        showFeedback: state.showFeedback,
                        onSelectAnswer: state.onSelectAnswer
                    )
                }

                Button(state.nextButtonLabel) {
                    state.onNextQuestion()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.buttonGradient)
                .foregroundStyle(.white)
                .cornerRadius(28)
                .glowEffect()
                .opacity(state.isNextButtonVisible ? 1.0 : 0.0)
                .disabled(state.isNextButtonDisabled)
            }
            .padding()
        }
    }
}

#Preview {
    QuizView(state: .preview)
}
