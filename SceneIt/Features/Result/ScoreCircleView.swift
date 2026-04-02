import SwiftUI

struct ScoreCircleView: View {

    let state: ResultViewState

    @Binding var animateScore: Bool

    var body: some View {

        ZStack {

            ForEach([160.0, 145.0, 130.0], id: \.self) { radius in
                Circle()
                    .stroke(
                        Theme.primary.opacity(0.07 + (160 - radius) * 0.005),
                        lineWidth: 1
                    )
                    .frame(width: radius * 2, height: radius * 2)
            }

            Circle()
                .trim(from: 0, to: animateScore ? state.progress : 0)
                .stroke(
                    state.progressColor,
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .frame(width: 280, height: 280)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.8), value: animateScore)
                .glowEffect(radius: 10)

            VStack(spacing: 2) {
                Text(state.scoreText)
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .foregroundStyle(Theme.primary)

                Text(state.totalText)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Theme.primary.opacity(0.45))
            }

            .frame(width: 320, height: 320)

        }
    }
}

#Preview {
    ZStack {
        Theme.bgGradient
            .ignoresSafeArea()
        ScoreCircleView(
            state: ResultViewState(score: 8, totalQuestions: 10, category: .comedy),
            animateScore: .constant(true)
        )
    }
}
