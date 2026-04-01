import Combine
import Foundation

@MainActor
final class ResultViewModel: ObservableObject {

    @Published private(set) var state: ResultViewState
   


    init(score: Int, totalQuestions: Int, category: Category) {
           self.state = ResultViewState(
               score: score,
               totalQuestions: totalQuestions,
               category: category
           )
       }
}
