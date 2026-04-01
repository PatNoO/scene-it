import SwiftUI

struct ResultView: View {

    @ObservedObject var viewModel: ResultViewModel
    let onRestart: () -> Void

    var body: some View {
        let state = viewModel.state

        ZStack {

            Theme.bgGradient
                .ignoresSafeArea()

            DotsBackgroundView()

            ScrollView {
                VStack(spacing: 0) {

                    VStack(spacing: 4) {
                        Text(state.title)
                            .font(.system(size: 20, weight: .bold))
                            .tracking(2)
                            .textCase(.uppercase)
                            .foregroundStyle(Theme.primary)

                        Text(state.subtitle)
                            .font(.system(size: 10, weight: .regular))
                            .tracking(3)
                            .textCase(.uppercase)
                            .foregroundStyle(Theme.primary.opacity(0.35))
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 16)

                    Text(state.categoryName)
                        .font(.system(size: 11, weight: .semibold))
                        .tracking(2)
                        .textCase(.uppercase)
                        .foregroundStyle(Theme.primary.opacity(0.8))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Theme.surface.opacity(0.5))
                        .overlay(
                            Capsule()
                                .stroke(
                                    Theme.primary.opacity(0.3),
                                    lineWidth: 1
                                )
                        )
                        .clipShape(Capsule())
                        .padding(.bottom, 24)

                    ScoreCircleView(state: state)
                        .padding(.bottom, 30)

                    DividerView()
                        .padding(.bottom, 16)

                    VStack(spacing: 6) {
                        Text(state.resultHeadLine)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(Color.white.opacity(0.85))
                            .multilineTextAlignment(.center)

                        Text(state.resultBody)
                            .font(Font.system(size: 13, weight: .regular))
                            .foregroundStyle(Color.white.opacity(0.4))
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 32)

                    Button(action: onRestart) {
                        Text(state.playAgainButton)
                            .font(.system(size: 14, weight: .bold))
                            .tracking(2)
                            .textCase(.uppercase)
                            .foregroundStyle(Color.white.opacity(0.9))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Theme.buttonGradient)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)

                }
            }

        }

    }

    private struct DotsBackgroundView: View {
        var body: some View {
            GeometryReader { _ in
                Canvas { context, size in
                    let spacing: CGFloat = 22
                    let cols = Int(size.width / spacing) + 1
                    let rows = Int(size.height / spacing) + 1
                    for row in 0..<rows {
                        for col in 0..<cols {
                            let x = CGFloat(col) * spacing
                            let y = CGFloat(row) * spacing
                            let rect = CGRect(
                                x: x - 1,
                                y: y - 1,
                                width: 2,
                                height: 2
                            )
                            context.fill(
                                Path(ellipseIn: rect),
                                with: .color(Color(hex: "AD2831").opacity(0.08))
                            )
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }

    private struct DividerView: View {
        var body: some View {
            LinearGradient(
                colors: [.clear, Theme.primary.opacity(0.2), .clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(height: 1)
            .padding(.horizontal, 24)
        }
    }

}

#Preview {
    ResultView(
        viewModel: ResultViewModel(
            score: 8,
            totalQuestions: 10,
            category: .komedi
        ),
        onRestart: {}
    )
}
