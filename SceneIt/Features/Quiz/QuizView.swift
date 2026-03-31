import SwiftUI

struct QuizView: View {
    let state: QuizViewState
    let onSelectAnswer: (Int) -> Void
    let onNextQuestion: () -> Void

    @State private var selectedIndex: Int? = nil

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
                        selectedIndex: $selectedIndex,
                        onSelectAnswer: onSelectAnswer
                    )
                }

                Button(state.nextButtonLabel) {
                    selectedIndex = nil
                    onNextQuestion()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.buttonGradient)
                .foregroundStyle(.white)
                .cornerRadius(28)
                .glowEffect()
                .opacity(selectedIndex != nil ? 1.0 : 0.0)
                .disabled(selectedIndex == nil)
            }
            .padding()
        }
    }
}

#Preview {
    QuizView(state: .preview, onSelectAnswer: { _ in }, onNextQuestion: { })
}
