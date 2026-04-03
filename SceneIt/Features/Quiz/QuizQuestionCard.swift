import SwiftUI

struct QuizQuestionCard: View {
    let question: String

    var body: some View {
        Text(question)
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
                    OctagonShape(cut: 10).stroke(
                        Theme.highlight.opacity(0.4),
                        lineWidth: 1.3
                    )
                    OctagonShape(cut: 10).inset(by: 8).stroke(
                        Theme.highlight.opacity(0.3),
                        lineWidth: 0.7
                    )
                    GeometryReader { geo in
                        Path { p in
                            p.move(to: CGPoint(x: geo.size.width * 0.3, y: 0))
                            p.addLine(
                                to: CGPoint(x: geo.size.width * 0.7, y: 0)
                            )
                        }
                        .stroke(Theme.highlight.opacity(0.6), lineWidth: 2)
                    }
                    GeometryReader { geo in
                        Path { p in
                            p.move(to: CGPoint(x: 0, y: geo.size.height * 0.35))
                            p.addLine(
                                to: CGPoint(x: 0, y: geo.size.height * 0.45)
                            )
                        }
                        .stroke(Theme.highlight.opacity(0.3), lineWidth: 1.2)
                    }
                    GeometryReader { geo in
                        Path { p in
                            p.move(
                                to: CGPoint(
                                    x: geo.size.width,
                                    y: geo.size.height * 0.35
                                )
                            )
                            p.addLine(
                                to: CGPoint(
                                    x: geo.size.width,
                                    y: geo.size.height * 0.45
                                )
                            )
                        }
                        .stroke(Theme.highlight.opacity(0.3), lineWidth: 1.2)
                    }
                }
            )
            .padding(.horizontal, 16)
    }
}
