import SwiftUI
 
struct CategoryCard: View {

    let category: CategoryItem

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

                    .foregroundStyle(Theme.highlight)

                    .kerning(1)

                    .textCase(.uppercase)

                Text(category.countLabel)

                    .font(.caption2)

                    .foregroundStyle(Theme.highlight.opacity(0.5))

            }

            .frame(maxWidth: .infinity)

            .padding(10)

            .background(Theme.surface)

            .cornerRadius(10)

            .overlay(

                RoundedRectangle(cornerRadius: 10)

                    .stroke(Theme.highlight, lineWidth: 1)

            )

        }

    }

}
 
