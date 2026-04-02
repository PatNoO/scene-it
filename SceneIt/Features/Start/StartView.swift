import SwiftUI
 
struct StartView: View {
 
    // View observerar ViewModel direkt så SwiftUI renderar om vid state-ändringar
    @ObservedObject var viewModel: StartViewModel
 
    var body: some View {
        // state läses från viewModel — View anropar aldrig viewModel direkt
        let state = viewModel.state
 
        ZStack {
 
            Theme.bgGradient
 
                .ignoresSafeArea()
 
            VStack(spacing: 16) {
 
                // App-ikon
 
                RoundedRectangle(cornerRadius: 14)
 
                    .fill(Theme.buttonGradient)
 
                    .frame(width: 80, height: 80)
 
                    .overlay(Text("🎬").font(.system(size: 40)))
 
                // Titel
 
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
 
                // Välj kategori
 
                Text(state.selectCategoryLabel)
 
                    .font(.caption2)
 
                    .foregroundStyle(Theme.highlight.opacity(0.8))
 
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
 
                    .overlay(Theme.highlight.opacity(0.6))
                
                    
 
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
                
                .padding(30)
                
                // Starta-knapp
 
                Button(state.startButtonLabel) {
 
                    state.onStart()
 
                }
 
                .frame(maxWidth: .infinity)
 
                .padding()
 
                .background(Theme.buttonGradient)
 
                .foregroundStyle(.white)
 
                .cornerRadius(28)
 
                .disabled(!state.isStartButtonEnabled)
 
            }
 
            .padding()
 
        }
 
    }
 
}
 
#Preview {
    StartView(viewModel: StartViewModel())
}
 
