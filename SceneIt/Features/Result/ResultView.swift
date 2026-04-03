import SwiftUI

struct ResultView: View {


    @ObservedObject var viewModel: ResultViewModel

    @State private var animateScore: Bool = false

    var body: some View {

        let state = viewModel.state

        ZStack {

            Theme.bgGradient
                .ignoresSafeArea()

            DotsBackgroundView()

            ScrollView {
                VStack() {

                    VStack(spacing: Spacing.large) {
                        Text(state.title)
                            .font(.system(size: FontSize.xxxLarge, weight: .bold))
                            .tracking(Tracking.normal)
                            .textCase(.uppercase)
                            .foregroundStyle(Theme.accent)

                        Text(state.subtitle)
                            .font(.system(size: FontSize.xSmall, weight: .regular))
                            .tracking(Tracking.wide)
                            .textCase(.uppercase)
                            .foregroundStyle(Theme.highlight.opacity(Opacity.strong))
                    }
                    .padding(.top, Spacing.huge)
                    .padding(.bottom, Spacing.large)

                    Text(state.categoryName)
                        .font(.system(size: FontSize.small, weight: .semibold))
                        .tracking(Tracking.normal)
                        .textCase(.uppercase)
                        .foregroundStyle(Theme.highlight.opacity(Opacity.muted))
                        .padding(.horizontal, Spacing.large)
                        .padding(.vertical, Spacing.xSmall)
                        .background(Theme.surface.opacity(Opacity.half))
                        .overlay(
                            Capsule()
                                .stroke(
                                    Theme.primary.opacity(Opacity.disabled),
                                    lineWidth: Layout.borderWidth
                                )
                        )
                        .clipShape(Capsule())
                        .padding(.bottom, Spacing.xxxLarge)

                    ScoreCircleView(state: state, animateScore: $animateScore)
                        .onAppear {
                            animateScore = true
                        }
                        .padding(.bottom, Spacing.xxxxLarge)
                    
                    if state.isNewHighScore {
                        Text(state.newHighScoreLabel)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(Theme.highlight)
                    } else if let label = state.highScoreLabel {
                        Text(label)
                            .font(.caption)
                            .foregroundStyle(Theme.highlight.opacity(Opacity.half))
                    }

                    DividerView()
                        .padding(.bottom, Spacing.large)

                    VStack(spacing: Spacing.xSmall) {
                        Text(state.resultHeadLine)
                            .font(.system(size: FontSize.xLarge, weight: .bold))
                            .foregroundStyle(Theme.text.opacity(Opacity.high))
                            .multilineTextAlignment(.center)

                        Text(state.resultBody)
                            .font(Font.system(size: FontSize.medium, weight: .regular))
                            .foregroundStyle(Color.white.opacity(Opacity.medium))
                            .multilineTextAlignment(.center)
                            .lineSpacing(Tracking.lineSpacing)
                    }
                    .padding(.horizontal, Spacing.huge)
                    .padding(.bottom, Spacing.huge)

                    Button(action: state.onRestart) {
                        Text(state.playAgainButton)
                            .font(.system(size: FontSize.large, weight: .bold))
                            .tracking(Tracking.normal)
                            .textCase(.uppercase)
                            .foregroundStyle(Color.white.opacity(Opacity.almostFull))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, Spacing.large)
                            .background(Theme.buttonGradient)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, Spacing.xxxLarge)
                    .padding(.bottom, Spacing.xLarge)

                }
            }

        }

    }


    private struct DividerView: View {
        var body: some View {
            LinearGradient(
                colors: [.clear, Theme.primary.opacity(Opacity.faint), .clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(height: Layout.dividerHeight)
            .padding(.horizontal, Spacing.xxxLarge)
        }
    }

}

#Preview {
    ResultView(viewModel: ResultViewModel(score: 7, totalQuestions: 10, category: .comedy, onRestart: {}))
}
