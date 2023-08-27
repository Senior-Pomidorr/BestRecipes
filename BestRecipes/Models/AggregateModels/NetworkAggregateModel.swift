import Foundation
import Combine

@MainActor
class NetworkAggregateModel: ObservableObject {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    @Published var alert: HTTPError = .unknown
    @Published var showAlertInView: Bool = false
    @Published var shortRecipeList1: [RecipeShort] = []
    @Published var shortRecipeList2: [RecipeShort] = []
    @Published var shortRecipeList3: [RecipeShort] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func searchRecipeShort(params: [String: Any]? = nil) {
        networkService.request(RecipeEndpoint.searchRecipe(params))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    alert = error
                    showAlertInView = true
                }
            }, receiveValue: { (shortRecipeList: ListOfRecipeShort) in
                self.shortRecipeList1 = shortRecipeList.results ?? []
            })
            .store(in: &cancellables)
    }
}
