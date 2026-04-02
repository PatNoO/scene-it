import SwiftUI
 
struct CategoryCard: View {

    let category: CategoryItem
    let isSelected: Bool
    let onSelect: (Category) -> Void
 
    var body: some View {

        Button {

            onSelect(category.category)

        } label: {

            VStack(spacing: 4) {

                Text(category.icon)

                    .font(.system(size: 24))

                Text(category.displayName)

                    .font(.caption2)

                    .fontWeight(.bold)

                    .foregroundStyle(Theme.highlight.opacity(0.8))

                    .kerning(1)

                    .textCase(.uppercase)

                Text(category.countLabel)

                    .font(.caption2)

                    .foregroundStyle(Theme.highlight.opacity(0.6))

            }

            .frame(maxWidth: .infinity)

            .padding(30)

            .background(Color.clear)

            .cornerRadius(10)

            .overlay(

                RoundedRectangle(cornerRadius: 10)

                    .stroke(Theme.highlight.opacity(0.5), lineWidth: 1)

            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Theme.highlight.opacity(0.8) : Color.clear, lineWidth: isSelected ? 2 : 0)
            )
            .modifier(GlowModifier(color: Color("SceneIt Colors/Highlight"), radius: isSelected ? 12 : 0))
            .animation(.easeInOut(duration: 0.2), value: isSelected)

        }

    }

}
 
