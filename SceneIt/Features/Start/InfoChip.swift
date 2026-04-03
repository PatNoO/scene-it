import SwiftUI

struct InfoChip: View {
    
    let value: Int
    let label: String
    
    var body: some View {
        VStack(spacing: Spacing.xxxSmall) {
            Text("\(value)")
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(Theme.highlight.opacity(Opacity.muted))
            Text(label)
                .font(.caption2)
                .foregroundStyle(Theme.highlight.opacity(Opacity.half))
                .kerning(Tracking.normal)
                .textCase(.uppercase)
        }
        .padding(.horizontal, Spacing.medium)
        .padding(.vertical, Spacing.xxSmall)
        .background(Theme.surface.opacity(Opacity.disabled))
        .cornerRadius(Layout.cornerRadiusSmall)
        .overlay(
            RoundedRectangle(cornerRadius: Layout.cornerRadiusSmall)
                .stroke(Theme.highlight.opacity(Opacity.half), lineWidth: Layout.borderWidth)
        )
    }
}
