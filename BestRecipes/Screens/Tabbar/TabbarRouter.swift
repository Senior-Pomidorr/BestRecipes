import SwiftUI

class TabbarRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case favourites
    case add
    case news
    case profile
}
