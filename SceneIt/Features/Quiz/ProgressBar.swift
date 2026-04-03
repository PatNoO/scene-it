import SwiftUI

struct ProgressBar: View {
    let progress: Double

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: Layout.progressBarCornerRadius)
                    .fill(Theme.highlight.opacity(Opacity.faintest))
                    .frame(height: Layout.progressBarHeight)
                RoundedRectangle(cornerRadius: Layout.progressBarCornerRadius)
                    .fill(Theme.progressGradient)
                    .frame(width: geo.size.width * progress, height: Layout.progressBarHeight)
                    .animation(.easeInOut, value: progress)
            }
        }
        .frame(height: Layout.progressBarHeight)
    }
}
