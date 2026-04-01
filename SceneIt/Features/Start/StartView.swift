import SwiftUI

struct StartView: View {

    let state: StartViewState

    var body: some View {

        ZStack {

            Theme.bgGradient

                .ignoresSafeArea()

            VStack(spacing: 16) {

                // App-ikon

                RoundedRectangle(cornerRadius: 14)

                    .fill(Theme.buttonGradient)

                    .frame(width: 52, height: 52)

                    .overlay(Text("🎬").font(.system(size: 22)))

                // Titel

                Text(state.appName)

                    .font(.largeTitle)

                    .fontWeight(.bold)

                    .foregroundStyle(Theme.primary)

                    .kerning(2)

                Text(state.tagline)

                    .font(.caption2)

                    .foregroundStyle(Theme.primary.opacity(0.35))

                    .kerning(3)

                    .textCase(.uppercase)

                Divider()

                    .overlay(Theme.primary.opacity(0.2))

                // Välj kategori

                Text(state.selectCategoryLabel)

                    .font(.caption2)

                    .foregroundStyle(Theme.primary.opacity(0.4))

                    .kerning(2)

                    .textCase(.uppercase)

                // Kategorikort

                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    spacing: 8
                ) {

                    ForEach(state.categories) { category in

                        CategoryCard(
                            category: category,
                            onSelect: state.onSelectCategory
                        )

                    }

                }

                Divider()

                    .overlay(Theme.primary.opacity(0.2))

                // Info-chips

                HStack(spacing: 8) {

                    InfoChip(
                        value: state.questionCount,
                        label: state.questionsLabel
                    )

                    InfoChip(
                        value: state.optionCount,
                        label: state.optionsLabel
                    )

                }

                // Starta-knapp

                Button(state.startButtonLabel) {

                    state.onStart()

                }

                .frame(maxWidth: .infinity)

                .padding()

                .background(Theme.buttonGradient)

                .foregroundStyle(.white)

                .cornerRadius(28)

                .glowEffect()
                
                .disabled(!state.isStartButtonEnabled)

            }

            .padding()

        }

    }

}

#Preview {

    StartView(state: .preview)

}
