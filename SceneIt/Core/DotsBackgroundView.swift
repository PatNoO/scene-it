import SwiftUI

struct DotsBackgroundView: View {
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
