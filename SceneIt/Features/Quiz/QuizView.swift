import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        let state = viewModel.state

        ZStack {
            Theme.bgGradient
                .ignoresSafeArea()
            
            DotsBackgroundView()

            VStack(spacing: 0) {

                HStack {
                    Text(state.questionLabel)
                        .font(.caption)
                        .foregroundStyle(Theme.highlight.opacity(0.4))
                    Spacer()
                    Text(state.scoreLabel)
                        .font(.caption)
                        .foregroundStyle(Theme.highlight.opacity(0.9))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Theme.primary.opacity(0.2))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Theme.highlight.opacity(0.2), lineWidth: 1)
                        )
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.top, 60)

                ProgressView(value: state.progress)
                    .tint(Theme.primary)
                    .padding(.horizontal)
                    .padding(.top, 8)

                Spacer()

                Text(state.seriesName.uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Theme.highlight.opacity(0.5))
                Text(state.categoryName.uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Theme.highlight.opacity(0.4))
                    .padding(.bottom, 48)

                Text(state.question)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(Theme.text.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 24)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.clear)
                    .clipShape(OctagonShape(cut: 10))
                    .overlay(
                        ZStack {
                            OctagonShape(cut: 10).stroke(Theme.highlight.opacity(0.4), lineWidth: 1.3)
                            OctagonShape(cut: 10).inset(by: 8).stroke(Theme.highlight.opacity(0.3), lineWidth: 0.7)
                            GeometryReader { geo in
                                Path { p in
                                    p.move(to: CGPoint(x: geo.size.width * 0.3, y: 0))
                                    p.addLine(to: CGPoint(x: geo.size.width * 0.7, y: 0))
                                }
                                .stroke(Theme.highlight.opacity(0.6), lineWidth: 2)
                            }
                            GeometryReader { geo in
                                Path { p in
                                    p.move(to: CGPoint(x: 0, y: geo.size.height * 0.35))
                                    p.addLine(to: CGPoint(x: 0, y: geo.size.height * 0.45))
                                }
                                .stroke(Theme.highlight.opacity(0.3), lineWidth: 1.2)
                            }
                            GeometryReader { geo in
                                Path { p in
                                    p.move(to: CGPoint(x: geo.size.width, y: geo.size.height * 0.35))
                                    p.addLine(to: CGPoint(x: geo.size.width, y: geo.size.height * 0.45))
                                }
                                .stroke(Theme.highlight.opacity(0.3), lineWidth: 1.2)
                            }
                        }
                    )
                    .padding(.horizontal, 16)

                LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible())], spacing: 20) {
                    ForEach(0..<4) { i in
                        AnswerButton(
                            index: i,
                            label: state.options[safe: i] ?? "",
                            showFeedback: state.showFeedback,
                            onSelectAnswer: state.onSelectAnswer,
                            background: state.backgroundColor(for: i),
                            foreground: state.foregroundColor(for: i),
                            border: state.borderColor(for: i),
                            badgeBackground: state.badgeBackground(for: i)
                        )
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: 60)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 60)

                Spacer()

                Button(state.nextButtonLabel) {
                    state.onNextQuestion()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.buttonGradient)
                .foregroundStyle(.white)
                .cornerRadius(28)
                .opacity(state.isNextButtonVisible ? 1.0 : 0.0)
                .disabled(state.isNextButtonDisabled)
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    QuizView(viewModel: QuizViewModel(category: .comedy, onFinished: { _, _, _ in }))
}
