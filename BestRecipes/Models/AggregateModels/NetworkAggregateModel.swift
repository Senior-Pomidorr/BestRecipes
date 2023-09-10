import Foundation
import Combine

@MainActor
class NetworkAggregateModel: ObservableObject {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        self.bookmarkedRecipes = UserDefaultService.shared.getStructs(forKey: "Bookmarks")
        self.recentRecipeList = UserDefaultService.shared.getStructs(forKey: "Recent") ?? []
    }
    
    @Published var alert: HTTPError = .unknown
    @Published var showAlertInView: Bool = false
    
    @Published var recipeInformation: RecipeFull?
    @Published var randomRecipesList: [RecipeFull]?

//    @Published var bookmarkedRecipes: [BookmarkRecipe]? = (UserDefaultService.shared.getStructs(forKey: "Bookmarks"))
    @Published var bookmarkedRecipes: [BookmarkRecipe]? = []
    @Published var shortRecipeListTrendingNow: [RecipeShort] = []
    @Published var shortRecipeListPopularCategory: [RecipeShort] = []
    @Published var shortRecipeListGeneral: [RecipeShort] = []
    @Published var fullRecipeList: [RecipeFull] = []
    @Published var categoryIndex = 0
    @Published var customRecipesArray: [MyRecipes]? = []

    @Published var recentRecipeList: [RecipeShort] = []
    
    @Published var shortRecipeListCuisines: [RecipeShort] = []
    @Published var shortRecipeListSearch: [RecipeShort] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func searchRecipeShort(params: [String: Any]? = nil, requestTag: RequestTag) {
        networkService.request(RecipeEndpoint.searchRecipe(params))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.alert = error
                    self?.showAlertInView = true
                }
            }, receiveValue: { [weak self] (shortRecipeList: ListOfRecipeShort) in
                switch requestTag {
                case .trendingNow:
                    //print(shortRecipeList.results?.count)
                    self?.shortRecipeListTrendingNow = shortRecipeList.results ?? []
                    //print(self?.shortRecipeListTrendingNow.count)
                case .popularCategory:
                    self?.shortRecipeListPopularCategory = shortRecipeList.results ?? []
                case .general:
                    self?.shortRecipeListGeneral = shortRecipeList.results ?? []
                case .cuisines:
                    self?.shortRecipeListCuisines = shortRecipeList.results ?? []
                case .search:
                    self?.shortRecipeListSearch = shortRecipeList.results ?? []
                }
            })
            .store(in: &cancellables)
    }
    
    func getRecipeById(id: String) {
        networkService.request(RecipeEndpoint.getRecipeByID(id: id))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.alert = error
                    self?.showAlertInView = true
                }
            }, receiveValue: { [weak self] (recipeDetail: RecipeFull) in
                self?.recipeInformation = recipeDetail
            })
            .store(in: &cancellables)
    }
    
    func getMultipleRecipes(params: [String: Any]) {
        networkService.request(RecipeEndpoint.getMultipleRecipes(params))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.alert = error
                    self?.showAlertInView = true
                }
            }, receiveValue: { [weak self] (recipeDetailFull: [RecipeFull]) in
                self?.fullRecipeList = recipeDetailFull
            })
            .store(in: &cancellables)
    }
    
    func getRandomRecipes(params: [String: Any]?) {
        networkService.request(RecipeEndpoint.getRandomRecipes(params))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.alert = error
                    self?.showAlertInView = true
                }
            }, receiveValue: { [weak self] (randomRecipes: RandomRecipeModel) in
                self?.randomRecipesList = randomRecipes.recipes
            })
            .store(in: &cancellables)
    }
}
