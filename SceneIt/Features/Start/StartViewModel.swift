import Combine
import Foundation

// StartViewModel äger affärslogiken för startvyn.
// onStart sätts av AppViewModel efter init så att self är tillgänglig.
@MainActor
final class StartViewModel: ObservableObject {

   // state är det enda StartView behöver läsa — aldrig public skrivbar
   @Published private(set) var state = StartViewState()

   // Sätts av AppViewModel — anropas när användaren trycker Starta
   var onStart: ((Category) -> Void)?

   init() {
       // Sätt callbacks i state så att View kan anropa dem utan att känna till ViewModel
       state.onSelectCategory = { [weak self] category in
           self?.state.selectedCategory = category
       }
       state.onStart = { [weak self] in
           guard let category = self?.state.selectedCategory else { return }
           self?.onStart?(category)
       }
   }
}
