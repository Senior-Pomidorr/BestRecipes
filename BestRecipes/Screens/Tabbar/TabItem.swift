import SwiftUI

struct TabItem: View {
    
    let width, height: CGFloat
    let iconName: String
    
    @ObservedObject var tabbarRouter: TabbarRouter
    let assignedPage: Page
    
    var body: some View {
        VStack {
            Image(iconName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Spacer()
        }
        .padding(.horizontal, -4)
        .foregroundColor(tabbarRouter.currentPage == assignedPage ? Color.theme.customPink : Color.theme.customGray.opacity(0.9))
        .onTapGesture {
            tabbarRouter.currentPage = assignedPage
        }
    }
}
