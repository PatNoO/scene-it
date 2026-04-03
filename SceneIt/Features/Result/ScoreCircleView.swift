import SwiftUI

struct ScoreCircleView: View {

    let state: ResultViewState

    @Binding var animateScore: Bool

    var body: some View {

        ZStack {

            Circle()
                .stroke(
                    state.progressColor.opacity(Opacity.ghost),
                    style: StrokeStyle(lineWidth: Layout.borderWidth, lineCap: .round)
                )
                .frame(width: Layout.scoreContainerSize, height: Layout.scoreContainerSize)

            Circle()
                .trim(from: 0, to: animateScore ? state.progress : 0)
                .stroke(
                    state.progressColor,
                    style: StrokeStyle(lineWidth: Layout.scoreProgressStroke, lineCap: .round)
                )
                .frame(width: Layout.scoreOuterRing, height: Layout.scoreOuterRing)
                .rotationEffect(.degrees(AnimationAngle.progressRingStart))
                .animation(.easeInOut(duration: AnimationDuration.score), value: animateScore)

            Circle()
                .stroke(
                    state.progressColor.opacity(Opacity.faint),
                    style: StrokeStyle(lineWidth: Layout.borderWidth, lineCap: .round)
                )
                .frame(width: Layout.scoreRingSize, height: Layout.scoreRingSize)

            Circle()
                .stroke(
                    state.progressColor.opacity(Opacity.ghost),
                    style: StrokeStyle(lineWidth: Layout.borderWidth, lineCap: .round)
                )
                .frame(width: Layout.scoreInnerTrack, height: Layout.scoreInnerTrack)

            Circle()
                .trim(from: 0, to: animateScore ? state.progress : 0)
                .stroke(
                    state.progressColor.opacity(Opacity.muted),
                    style: StrokeStyle(lineWidth: Layout.scoreProgressStroke, lineCap: .round)
                )
                .frame(width: Layout.scoreInnerRing, height: Layout.scoreInnerRing)
                .rotationEffect(.degrees(AnimationAngle.progressRingStart))
                .animation(.easeInOut(duration: AnimationDuration.score), value: animateScore)

            Circle()
                .stroke(
                    state.progressColor.opacity(Opacity.faint),
                    style: StrokeStyle(lineWidth: Layout.borderWidth, lineCap: .round)
                )
                .frame(width: Layout.scoreCoreTrack, height: Layout.scoreCoreTrack)

            VStack(spacing: Spacing.xxxSmall) {

                Text(state.scoreText)
                    .font(.system(size: FontSize.score, weight: .bold, design: .rounded))
                    .foregroundStyle(Theme.primary)

                Text(state.totalText)
                    .font(.system(size: FontSize.xxLarge, weight: .regular))
                    .foregroundStyle(Theme.primary.opacity(Opacity.faded))
            }

            .frame(width: Layout.scoreContainerSize, height: Layout.scoreContainerSize)
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
