import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        let state = viewModel.state

        ZStack {
            Theme.bgGradient
                .ignoresSafeArea()

            DotsBackgroundView()

            VStack(spacing: Spacing.none) {

                HStack {
                    Text(state.questionLabel)
                        .font(.caption)
                        .foregroundStyle(
                            Theme.highlight.opacity(Opacity.medium)
                        )
                    Spacer()
                    Text(state.scoreLabel)
                        .font(.caption)
                        .foregroundStyle(
                            Theme.highlight.opacity(Opacity.almostFull)
                        )
                        .padding(.horizontal, Spacing.medium)
                        .padding(.vertical, Spacing.xxSmall)
                        .background(Theme.primary.opacity(Opacity.faint))
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: Layout.cornerRadiusMedium
                            )
                            .stroke(
                                Theme.highlight.opacity(Opacity.faint),
                                lineWidth: Layout.borderWidth
                            )
                        )
                        .cornerRadius(Layout.cornerRadiusMedium)
                }
                .padding(.horizontal)
                .padding(.top, Spacing.xxHuge)

                ProgressBar(progress: state.progress)
                    .padding(.horizontal)
                    .padding(.top, Spacing.small)

                Spacer()

                Text(state.seriesName.uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Theme.highlight.opacity(Opacity.half))
                Text(state.categoryName.uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Theme.highlight.opacity(Opacity.medium))
                    .padding(.bottom, Spacing.xHuge)

                QuizQuestionCard(question: state.question)

                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: Spacing.xLarge),
                        GridItem(.flexible()),
                    ],
                    spacing: Spacing.xLarge
                ) {
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
                        .frame(minHeight: Layout.buttonHeight)
                    }
                }
                .padding(.horizontal, Spacing.large)
                .padding(.top, Spacing.xxHuge)

                Spacer()

                Button(state.nextButtonLabel) {
                    state.onNextQuestion()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.buttonGradient)
                .foregroundStyle(.white)
                .cornerRadius(Layout.cornerRadiusButton)
                .opacity(
                    state.isNextButtonVisible ? Opacity.full : Opacity.none
                )
                .disabled(state.isNextButtonDisabled)
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    QuizView(
        viewModel: QuizViewModel(category: .comedy, onFinished: { _, _, _ in })
    )
}
