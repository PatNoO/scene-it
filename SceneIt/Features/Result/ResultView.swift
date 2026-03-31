//
//  ResultView.swift
//  SceneIt
//
//  Created by Patrik Noordh on 2026-03-31.
//

import SwiftUI

struct ResultView: View {

    let state: ResultViewState

    var body: some View {
        Text(state.categoryName)
    }
}

#Preview {
    ResultView(state: .preview)
}
