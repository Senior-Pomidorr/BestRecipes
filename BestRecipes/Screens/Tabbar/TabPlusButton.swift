import SwiftUI

struct TabPlusButton: View {
    
    let width, height: CGFloat
    var acttion: () -> Void
    
    var body: some View {
        Image("add")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .foregroundColor(Color.theme.customBlack)
            .shadow(color: Color.theme.customGray.opacity(0.6), radius: 3, x: 0, y: -2)
            .onTapGesture {
                acttion()
            }
            .padding(.horizontal, -4)
    }
}
