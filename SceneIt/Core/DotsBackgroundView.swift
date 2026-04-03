import SwiftUI

struct DotsBackgroundView: View {
    var body: some View {
        GeometryReader { _ in
            Canvas { context, size in
                let spacing = Layout.dotSpacing
                let cols = Int(size.width / spacing) + 1
                let rows = Int(size.height / spacing) + 1
                for row in 0..<rows {
                    for col in 0..<cols {
                        let x = CGFloat(col) * spacing
                        let y = CGFloat(row) * spacing
                        let rect = CGRect(
                            x: x - Layout.dotSize / 2,
                            y: y - Layout.dotSize / 2,
                            width: Layout.dotSize,
                            height: Layout.dotSize
                        )
                        context.fill(
                            Path(ellipseIn: rect),
                            with: .color(Color(Theme.highlight).opacity(Opacity.dots))
                        )
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}
