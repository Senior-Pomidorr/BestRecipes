import SwiftUI

@main
struct BestRecipesApp: App {
    
    @StateObject private var networkAggregateModel = NetworkAggregateModel(networkService: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            TestScreen()
            //ContentView()
                .environmentObject(networkAggregateModel)
        }
    }
}
