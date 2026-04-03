import SwiftUI

struct ScoreCircleView: View {

    let state: ResultViewState

    @Binding var animateScore: Bool

    var body: some View {

        ZStack {

            Circle()
                .stroke(
                    state.progressColor.opacity(0.15),
                    style: StrokeStyle(lineWidth: 1, lineCap: .round)
                )
                .frame(width: 320, height: 320)

            Circle()
                .trim(from: 0, to: animateScore ? state.progress : 0)
                .stroke(
                    state.progressColor,
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.8), value: animateScore)

            Circle()
                .stroke(
                    state.progressColor.opacity(0.2),
                    style: StrokeStyle(lineWidth: 1, lineCap: .round)
                )
                .frame(width: 280, height: 280)

            Circle()
                .stroke(
                    state.progressColor.opacity(0.15),
                    style: StrokeStyle(lineWidth: 1, lineCap: .round)
                )
                .frame(width: 258, height: 258)

            Circle()
                .trim(from: 0, to: animateScore ? state.progress : 0)
                .stroke(
                    state.progressColor.opacity(0.6),
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                .frame(width: 246, height: 246)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.8), value: animateScore)

            Circle()
                .stroke(
                    state.progressColor.opacity(0.2),
                    style: StrokeStyle(lineWidth: 1, lineCap: .round)
                )
                .frame(width: 234, height: 234)

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
            state: ResultViewState(
                score: 8,
                totalQuestions: 10,
                category: .comedy
            ),
            animateScore: .constant(true)
        )
    }
}
