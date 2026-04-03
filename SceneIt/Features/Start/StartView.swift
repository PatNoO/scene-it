import SwiftUI

struct StartView: View {
    
    @ObservedObject var viewModel: StartViewModel
    
    var body: some View {
        let state = viewModel.state
        
        ZStack {
            Theme.bgGradient
                .ignoresSafeArea()
            
            DotsBackgroundView()
            
            VStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Theme.buttonGradient)
                    .frame(width: 80, height: 80)
                    .overlay(Text("🎬").font(.system(size: 40)))
                Text(state.appName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.accent)
                    .kerning(2)
                Text(state.tagline)
                    .font(.caption2)
                    .foregroundStyle(Theme.highlight.opacity(0.8))
                    .kerning(3)
                    .textCase(.uppercase)
                    .padding(10)
                Divider()
                    .overlay(Theme.highlight.opacity(0.4))
                    .padding(10)
                Text(state.selectCategoryLabel)
                    .font(.caption2)
                    .foregroundStyle(Theme.highlight.opacity(0.8))
                    .kerning(2)
                    .textCase(.uppercase)
                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    spacing: 8
                ) {
                    ForEach(state.categories) { item in
                        CategoryCard(
                            category: item,
                            selectionBorder: state.selectionBorder(for:item.category),
                            selectionBorderWidth: state.selectionBorderWidth(for: item.category),
                            glowRadius: state.glowRadius(for: item.category),
                            onSelect: state.onSelectCategory
                        )
                    }
                }
                
                Divider()
                    .overlay(Theme.highlight.opacity(0.6))
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
                .padding(30)
                
                if state.isStartButtonEnabled {
                    Button(state.startButtonLabel) {
                        state.onStart()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                    .padding()
                    .background(Theme.buttonGradient)
                    .foregroundStyle(.white)
                    .cornerRadius(28)
                    .opacity(state.isStartButtonEnabled ? 1.0 : 0.5)
                    .disabled(!state.isStartButtonEnabled)
                } else {
                    Color.clear
                        .frame(height: 20)
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
