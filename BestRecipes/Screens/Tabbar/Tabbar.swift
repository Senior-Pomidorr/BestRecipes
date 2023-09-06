import SwiftUI

struct Tabbar: View {
    
    @StateObject var tabbarRouter = TabbarRouter()
    @State var isShowPopUp = false
    @State private var inputImage: UIImage?
    
    @ViewBuilder
    var contentView: some View {
        switch tabbarRouter.currentPage {
        case .home:
            MainHomeView()
                .environmentObject(tabbarRouter)
        case .favourites:
            SavedRecipesView()
                .environmentObject(tabbarRouter)
        case .news:
            TrendingNowView()
                .environmentObject(tabbarRouter)
        case .profile:
            ProfileView(inputImage: $inputImage)
                .environmentObject(tabbarRouter)
        case .add:
            AddRecipeView(inputImage: $inputImage)
                .environmentObject(tabbarRouter)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                contentView
                VStack {
                    Spacer()
                    HStack {
                        TabItem(width: geometry.size.width / 5, height: geometry.size.height / 18, iconName: "home", tabbarRouter: tabbarRouter, assignedPage: .home)
                        TabItem(width: geometry.size.width / 5, height: geometry.size.height / 18, iconName: "save", tabbarRouter: tabbarRouter, assignedPage: .favourites)
                        TabPlusButton(width: geometry.size.width / 7, height: geometry.size.width / 7, acttion: showPopUp)
                            .offset(y: -geometry.size.height / 8/2)
                        TabItem(width: geometry.size.width / 5, height: geometry.size.height / 18, iconName: "call", tabbarRouter: tabbarRouter, assignedPage: .news)
                        TabItem(width: geometry.size.width / 5, height: geometry.size.height / 18, iconName: "user", tabbarRouter: tabbarRouter, assignedPage: .profile)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(TabbarCurvedShape(radius: geometry.size.width / 12, height: geometry.size.height / 8))
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $isShowPopUp) {
            // action on dismiss
        } content: {
            AddRecipeView(inputImage: $inputImage)
        }
    }
    
    func showPopUp() {
        isShowPopUp = true
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
