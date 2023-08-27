import SwiftUI

struct TestScreen: View {
    
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    
    var body: some View {
        
        VStack {
            Button {
                print("--- Запускаем тестовый запрос ---")
                networkAggregateModel.searchRecipeShort()
            } label: {
                //Text(R.string.localizable.testScreenStartrequest)
                Text("testScreen.startrequest")
            }
            
            List(networkAggregateModel.shortRecipeList1) { recipe in
                Text(recipe.title ?? "Не пришло название рецепта")
            }
            
        }
        .alert(isPresented: $networkAggregateModel.showAlertInView, error: networkAggregateModel.alert) { _ in
            Button("OK", role: .cancel) {
                
            }
        } message: { error in
            Text("Code: \(error.errorCode) - \(error.errorDescription ?? "")")
        }


    }
}

struct TestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestScreen()
    }
}
