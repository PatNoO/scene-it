import SwiftUI
 
@main

struct SceneItApp: App {

    @StateObject var startViewModel = StartViewModel()
 
    var body: some Scene {

        WindowGroup {

            StartView(state: startViewModel.state)

        }

    }

}
 
