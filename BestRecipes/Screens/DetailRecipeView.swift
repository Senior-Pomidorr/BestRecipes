import SwiftUI

struct DetailRecipeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showContextMenu = false
    
    var body: some View {
        VStack {
            Text("Title of recipe")
                .font(Poppins.Black)
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton, trailing: menuButton)
    }
    
    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left").foregroundColor(.black)
        }
    }
    
    var menuButton: some View {
        Menu {
            Button("Добавить в избранное",
                   action: { print("Action 1 triggered") })
            
            Button("Поделиться",
                   action: { print("Action 2 triggered") })
        } label: {
            Image(systemName: "ellipsis").foregroundColor(.black)
        }
    }
}

struct DetailRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecipeView()
    }
}
