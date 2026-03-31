import SwiftUI

struct QuizView: View {
    let state: QuizViewState
    let onNextQuestion: () -> Void

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
                    Button(option) { }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(state.buttonBackground(for: index))
                    .foregroundStyle(state.buttonText(for: index))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(state.buttonBorder(for: index), lineWidth: 1)
                    )
                }

                Button(state.nextButtonLabel) {
                    onNextQuestion()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.buttonGradient)
                .foregroundStyle(.white)
                .cornerRadius(28)
                .glowEffect()
                .opacity(state.nextButtonOpacity)
                .disabled(state.nextButtonDisabled)
            }
            .padding()
        }
    }
}

#Preview {
    QuizView(state: QuizViewState(), onNextQuestion: { })
}
