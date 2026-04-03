import SwiftUI

struct CategoryCard: View {
    
    let category: CategoryItem
    let selectionBorder: Color
    let selectionBorderWidth: CGFloat
    let glowRadius: CGFloat
    let onSelect: (Category) -> Void
    
    var body: some View {
        Button {
            onSelect(category.category)
        } label: {
            VStack(spacing: Spacing.xxSmall) {
                Text(category.icon)
                    .font(.system(size: FontSize.icon))
                Text(category.displayName)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.highlight.opacity(Opacity.strong))
                    .kerning(Tracking.normal)
                    .textCase(.uppercase)
                Text(category.countLabel)
                    .font(.caption2)
                    .foregroundStyle(Theme.highlight.opacity(Opacity.muted))
            }
            .frame(maxWidth: .infinity)
            .padding(Spacing.xxxxLarge)
            .background(Color.clear)
            .cornerRadius(Layout.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Layout.cornerRadius)
                    .stroke(Theme.highlight.opacity(Opacity.half), lineWidth: Layout.borderWidth)
            )
            .overlay(
                RoundedRectangle(cornerRadius: Layout.cornerRadius)
                    .stroke(selectionBorder, lineWidth: selectionBorderWidth)
            )
            .modifier(GlowModifier(color: Theme.highlight, radius: glowRadius))
            .animation(.easeInOut(duration: AnimationDuration.fast), value: glowRadius)
        }
    }
}
