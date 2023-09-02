import SwiftUI

struct TestScreen: View {
    
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    
    var body: some View {
        
        VStack {
            Button {
                print("--- Запускаем тестовый запрос ---")
                //networkAggregateModel.searchRecipeShort(requestTag: .general)
               // networkAggregateModel.getRecipeById(id: "716300")
                networkAggregateModel.getMultipleRecipes(params: ["ids": "715538,716429"])
            } label: {
                Text("testScreen.startrequest")
            }
            
            Button {
                print("--- Запускаем что-то тестовое ---")
                UserDefaultService.shared.saveStructs(structs: ["1111", "2222"], forKey: "test")
                let testData: [String] = UserDefaultService.shared.getStructs(forKey: "test") ?? []
                print(testData)
            } label: {
                Text("Test something")
            }
            
//            List(networkAggregateModel.shortRecipeListGeneral) { recipe in
//                Text(recipe.title ?? "Не пришло название рецепта")
//            }
          //  Text(networkAggregateModel.recipeInformation?.sourceName ?? "Не пришли данные")
            Text(String(networkAggregateModel.fullRecipeList.count))
            
        }
        .alert(isPresented: $networkAggregateModel.showAlertInView, error: networkAggregateModel.alert) { _ in
            Button("OK", role: .cancel) {
                
            }
        } message: { error in
            Text("Code: \(error.errorCode) - \(error.errorDescription ?? "")")
        }


    }
}

//struct TestScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        TestScreen()
//    }
//}
