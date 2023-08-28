import SwiftUI

struct TabItem: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    @ObservedObject var tabbarRouter: TabbarRouter
    let assignedPage: Page
    
    var body: some View {
        VStack {
            Image(systemName: tabbarRouter.currentPage == assignedPage ? systemIconName + ".fill" : systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .foregroundColor(tabbarRouter.currentPage == assignedPage ? Color.theme.customPink : Color.theme.customGray.opacity(0.9))
        .onTapGesture {
            print("нажали", assignedPage)
            print("текущая", tabbarRouter.currentPage)
            tabbarRouter.currentPage = assignedPage
        }
    }
}
