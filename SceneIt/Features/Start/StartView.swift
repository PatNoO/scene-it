import SwiftUI

struct StartView: View {
    
    @ObservedObject var viewModel: StartViewModel
    
    var body: some View {
        
        let state = viewModel.state
        ZStack {
            Theme.bgGradient
                .ignoresSafeArea()
            DotsBackgroundView()
            VStack(spacing: Spacing.large) {
                VStack(spacing: Spacing.none) {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: Layout.logoWidth)
                        .padding(.bottom, -Spacing.large)
                    Text(state.tagline)
                        .font(.caption2)
                        .foregroundStyle(Theme.highlight.opacity(Opacity.medium))
                        .kerning(Tracking.wide)
                        .textCase(.uppercase)
                }
                Divider()
                    .overlay(Theme.highlight.opacity(Opacity.medium))
                    .padding(Spacing.medium)
                Text(state.selectCategoryLabel)
                    .font(.caption2)
                    .foregroundStyle(Theme.highlight.opacity(Opacity.strong))
                    .kerning(Tracking.normal)
                    .textCase(.uppercase)
                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    spacing: Spacing.small
                ) {
                    ForEach(state.categories) { item in
                        CategoryCard(
                            category: item,
                            selectionBorder: state.selectionBorder(for: item.category),
                            selectionBorderWidth: state.selectionBorderWidth(for: item.category),
                            glowRadius: state.glowRadius(for: item.category),
                            onSelect: state.onSelectCategory
                        )
                    }
                }
                
                Divider()
                    .overlay(Theme.highlight.opacity(Opacity.muted))
                HStack(spacing: Spacing.small) {
                    InfoChip(
                        value: state.questionCount,
                        label: state.questionsLabel
                    )
                    InfoChip(
                        value: state.optionCount,
                        label: state.optionsLabel
                    )
                }
                .padding(Spacing.xxxxLarge)
                if state.isStartButtonEnabled {
                    Button(state.startButtonLabel) {
                        state.onStart()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: Spacing.xLarge)
                    .padding()
                    .background(Theme.buttonGradient)
                    .foregroundStyle(.white)
                    .cornerRadius(Layout.cornerRadiusButton)
                    .opacity(state.isStartButtonEnabled ? Opacity.full : Opacity.half)
                    .disabled(!state.isStartButtonEnabled)
                } else {
                    Color.clear
                        .frame(height: Spacing.xLarge)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    StartView(viewModel: StartViewModel())
}
