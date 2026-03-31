import SwiftUI

struct ScoreCircleView: View {

    let state: ResultViewState

    var body: some View {
        
        ZStack {
            
            ForEach([90.0, 78.0, 66.0], id: \.self) { radius in
                Circle()
                    .stroke(Theme.primary.opacity(0.07 + (90 - radius) * 0.005), lineWidth: 1)
                    .frame(width: radius * 2, height: radius * 2)
            }
            
            Circle()
                .trim(from: 0, to: state.progress)
                .stroke(
                    state.progressColor,
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                .frame(width: 168, height: 168)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.8), value: state.progress)
                .glowEffect(radius: 6)
            
            VStack(spacing: 2) {
                Text(state.scoreText)
                    .font(.system(size: 64, weight: .bold, design: .rounded))
                    .foregroundStyle(Theme.primary)
                
                Text(state.totalText)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(Theme.primary.opacity(0.45))
            }
            .frame(width: 200, height: 200)
            
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
                category: .komedi
            )
        )
    }
}
