import SwiftUI

@main
struct BestRecipesApp: App {
    
    @StateObject private var networkAggregateModel = NetworkAggregateModel(networkService: NetworkService())
    
    @AppStorage("onboardingHasShown")
    var onboardingHasShown = false
    
    var body: some Scene {
        WindowGroup {
            if onboardingHasShown {
                Tabbar()
                    .environmentObject(networkAggregateModel)
            } else {
                OnboardingMain()
                    .environmentObject(networkAggregateModel)
                //            Tabbar()
                //TestScreen()
                //ContentView()
            }
        }
    }
}
