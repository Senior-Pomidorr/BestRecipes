import SwiftUI

@main
struct BestRecipesApp: App {
    
    @StateObject private var networkAggregateModel = NetworkAggregateModel(networkService: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            Tabbar()
            //TestScreen()
            //ContentView()
                .environmentObject(networkAggregateModel)
        }
    }
}
