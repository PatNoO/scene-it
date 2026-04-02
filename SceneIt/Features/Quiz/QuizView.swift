import SwiftUI

private struct QuestionFrameKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

private struct ButtonFrameKey: PreferenceKey {
    static var defaultValue: [Int: CGRect] = [:]
    static func reduce(value: inout [Int: CGRect], nextValue: () -> [Int: CGRect]) {
        value.merge(nextValue()) { $1 }
    }
}

struct QuizView: View {
    let state: QuizViewState
    @State private var questionFrame: CGRect = .zero
    @State private var buttonFrames: [Int: CGRect] = [:]

    var body: some View {
        ZStack {
            Theme.bgGradient
                .ignoresSafeArea()

            Text("?")
                .font(.system(size: 160, weight: .bold))
                .foregroundStyle(Theme.highlight.opacity(0.04))
                .offset(y: 30)

            Canvas { context, _ in
                guard questionFrame != .zero,
                      buttonFrames.count == 4 else { return }
                let line = Theme.highlight.opacity(0.7)

                for i in 0..<4 {
                    guard let f = buttonFrames[i] else { continue }
                    var p = Path()
                    p.move(to: CGPoint(x: f.midX, y: questionFrame.maxY))
                    p.addLine(to: CGPoint(x: f.midX, y: f.minY))
                    context.stroke(p, with: .color(line), lineWidth: 1.5)
                    context.fill(
                        Path(ellipseIn: CGRect(
                            x: f.midX - 3, y: f.minY - 3, width: 6, height: 6
                        )),
                        with: .color(Theme.highlight)
                    )
                }
            }
            .ignoresSafeArea()
            .allowsHitTesting(false)

            VStack(spacing: 0) {

                HStack {
                    Text(state.questionLabel)
                        .font(.caption)
                        .foregroundStyle(Theme.highlight.opacity(0.6))
                    Spacer()
                    Text(state.categoryName.uppercased())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(Theme.highlight.opacity(0.8))
                    Spacer()
                    Text(state.scoreLabel)
                        .font(.caption)
                        .foregroundStyle(Theme.highlight)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Theme.surface)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.top)

                ProgressView(value: state.progress)
                    .tint(Theme.highlight)
                    .padding(.horizontal)
                    .padding(.top, 8)

                Spacer()

                // Frågeruta
                Text(state.question)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 28)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .background(Theme.surface)
                    .clipShape(OctagonShape(cut: 20))
                    .overlay(OctagonShape(cut: 20).stroke(Theme.highlight, lineWidth: 1.5))
                    .padding(.horizontal, 16)
                    .background(
                        GeometryReader { geo in
                            Color.clear.preference(
                                key: QuestionFrameKey.self,
                                value: geo.frame(in: .global)
                            )
                        }
                    )
                    .onPreferenceChange(QuestionFrameKey.self) { questionFrame = $0 }

                // A och B
                HStack {
                    AnswerButton(
                        index: 0,
                        label: state.options[safe: 0] ?? "",
                        isCorrect: 0 == state.correctAnswerIndex,
                        isSelected: state.isSelected(0),
                        showFeedback: state.showFeedback,
                        onSelectAnswer: state.onSelectAnswer
                    )
                    .frame(width: 100)
                    .overlay(GeometryReader { geo in
                        Color.clear.preference(key: ButtonFrameKey.self,
                            value: [0: geo.frame(in: .global)])
                    })

                    Spacer()

                    AnswerButton(
                        index: 1,
                        label: state.options[safe: 1] ?? "",
                        isCorrect: 1 == state.correctAnswerIndex,
                        isSelected: state.isSelected(1),
                        showFeedback: state.showFeedback,
                        onSelectAnswer: state.onSelectAnswer
                    )
                    .frame(width: 100)
                    .overlay(GeometryReader { geo in
                        Color.clear.preference(key: ButtonFrameKey.self,
                            value: [1: geo.frame(in: .global)])
                    })
                }
                .onPreferenceChange(ButtonFrameKey.self) { buttonFrames.merge($0) { $1 } }
                .padding(.horizontal, 16)
                .padding(.top, 60)

                // C och D
                HStack(spacing: 12) {
                    AnswerButton(
                        index: 2,
                        label: state.options[safe: 2] ?? "",
                        isCorrect: 2 == state.correctAnswerIndex,
                        isSelected: state.isSelected(2),
                        showFeedback: state.showFeedback,
                        onSelectAnswer: state.onSelectAnswer
                    )
                    .frame(width: 100)
                    .overlay(GeometryReader { geo in
                        Color.clear.preference(key: ButtonFrameKey.self,
                            value: [2: geo.frame(in: .global)])
                    })

                    AnswerButton(
                        index: 3,
                        label: state.options[safe: 3] ?? "",
                        isCorrect: 3 == state.correctAnswerIndex,
                        isSelected: state.isSelected(3),
                        showFeedback: state.showFeedback,
                        onSelectAnswer: state.onSelectAnswer
                    )
                    .frame(width: 100)
                    .overlay(GeometryReader { geo in
                        Color.clear.preference(key: ButtonFrameKey.self,
                            value: [3: geo.frame(in: .global)])
                    })
                }
                .onPreferenceChange(ButtonFrameKey.self) { buttonFrames.merge($0) { $1 } }
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
                .glowEffect()
                .opacity(state.isNextButtonVisible ? 1.0 : 0.0)
                .disabled(state.isNextButtonDisabled)
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

#Preview {
    QuizView(state: .preview)
}
