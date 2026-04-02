import SwiftUI
 
struct InfoChip: View {
    
    let value: Int
    let label: String
    var body: some View {

        VStack(spacing: 2) {
            Text("\(value)")
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(Theme.highlight.opacity(0.6))
            Text(label)
                .font(.caption2)
                .foregroundStyle(Theme.highlight.opacity(0.5))
                .kerning(1)
                .textCase(.uppercase)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(Theme.surface.opacity(0.3))
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Theme.highlight.opacity(0.5), lineWidth: 1)
        )
    }
}
