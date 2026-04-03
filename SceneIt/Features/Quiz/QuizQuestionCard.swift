import SwiftUI

struct QuizQuestionCard: View {
    let question: String

    var body: some View {
        Text(question)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundStyle(Theme.text.opacity(Opacity.high))
            .multilineTextAlignment(.center)
            .padding(.vertical, Spacing.xxxLarge)
            .padding(.horizontal, Spacing.large)
            .frame(maxWidth: .infinity)
            .background(Color.clear)
            .clipShape(OctagonShape(cut: Layout.octagonCut))
            .overlay(
                ZStack {
                    OctagonShape(cut: Layout.octagonCut).stroke(
                        Theme.highlight.opacity(Opacity.medium),
                        lineWidth: Layout.octagonStroke
                    )
                    OctagonShape(cut: Layout.octagonCut).inset(
                        by: Layout.octagonInset
                    ).stroke(
                        Theme.highlight.opacity(Opacity.disabled),
                        lineWidth: Layout.octagonInsetStroke
                    )
                    GeometryReader { geo in
                        Path { p in
                            p.move(
                                to: CGPoint(
                                    x: geo.size.width
                                        * OctagonDecoration.topLineStart,
                                    y: Spacing.none
                                )
                            )
                            p.addLine(
                                to: CGPoint(
                                    x: geo.size.width
                                        * OctagonDecoration.topLineEnd,
                                    y: Spacing.none
                                )
                            )
                        }
                        .stroke(
                            Theme.highlight.opacity(Opacity.muted),
                            lineWidth: Layout.borderWidthSelected
                        )
                    }
                    GeometryReader { geo in
                        Path { p in
                            p.move(
                                to: CGPoint(
                                    x: Spacing.none,
                                    y: geo.size.height
                                        * OctagonDecoration.sideLineStart
                                )
                            )
                            p.addLine(
                                to: CGPoint(
                                    x: Spacing.none,
                                    y: geo.size.height
                                        * OctagonDecoration.sideLineEnd
                                )
                            )
                        }
                        .stroke(
                            Theme.highlight.opacity(Opacity.disabled),
                            lineWidth: Layout.octagonLineStroke
                        )
                    }
                    GeometryReader { geo in
                        Path { p in
                            p.move(
                                to: CGPoint(
                                    x: geo.size.width,
                                    y: geo.size.height
                                        * OctagonDecoration.sideLineStart
                                )
                            )
                            p.addLine(
                                to: CGPoint(
                                    x: geo.size.width,
                                    y: geo.size.height
                                        * OctagonDecoration.sideLineEnd
                                )
                            )
                        }
                        .stroke(
                            Theme.highlight.opacity(Opacity.disabled),
                            lineWidth: Layout.octagonLineStroke
                        )
                    }
                }
            )
            .padding(.horizontal, Spacing.large)
    }
}
