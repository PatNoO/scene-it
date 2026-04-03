import SwiftUI

struct ProgressBar: View {
    let progress: Double

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Theme.highlight.opacity(0.15))
                    .frame(height: 4)
                RoundedRectangle(cornerRadius: 4)
                    .fill(Theme.progressGradient)
                    .frame(width: geo.size.width * progress, height: 4)
                    .animation(.easeInOut, value: progress)
            }
        }
        .frame(height: 4)
    }
}
