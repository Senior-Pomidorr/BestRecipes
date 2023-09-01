import SwiftUI
import Kingfisher

struct DetailRecipeView: View {
    
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showContextMenu = false
    
    var recipeID: String
    
    init(recipeID: String) {
        self.recipeID = recipeID
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(networkAggregateModel.recipeInformation?.title ?? "detailRecipe.nonameofrecipe".localized)
                        .font(.custom(Poppins.Bold, size: 24))
                        .foregroundColor(Color.theme.customBlack)
                    
                    KFImage(URL(string: networkAggregateModel.recipeInformation?.image ?? ""))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .shadow(color: Color.theme.customBlack.opacity(0.5), radius: 3, x: 0, y: -2)
                    
                    if networkAggregateModel.recipeInformation != nil {
                        HStack {
                            Image("Star")
                                .foregroundColor(Color.theme.customBlack)
                            
                            Text(String(randomBetween4and5()))
                                .font(.custom(Poppins.SemiBold, size: 14))
                                .foregroundColor(Color.theme.customBlack)
                            
                            Text("(" + String(randomBetween10and300()) + ") " + "detailRecipe.reviews".localized)
                                .font(.custom(Poppins.Light, size: 14))
                                .foregroundColor(Color.theme.customBlack)
                            
                            Spacer()
                        }
                    } else {
                        HStack {
                            Text("detailRecipe.norating".localized)
                                .font(.custom(Poppins.SemiBold, size: 14))
                                .foregroundColor(Color.theme.customBlack)
                        }
                    }
                    
                    HStack {
                        Text("detailRecipe.instructions".localized)
                            .font(.custom(Poppins.SemiBold, size: 20))
                            .foregroundColor(Color.theme.customBlack)
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        if networkAggregateModel.recipeInformation?.analyzedInstructions?.count ?? 0 > 0 {
                            ForEach(networkAggregateModel.recipeInformation?.analyzedInstructions?.first?.steps ?? [], id: \.self) { step in
                                HStack(alignment: .firstTextBaseline) {
                                    Text(String(step.number ?? 0) + ".")
                                    Text(step.step ?? "no text")
                                    
                                }
                            }
                        } else {
                            Text("detailRecipe.noinstructions".localized)
                                .font(.custom(Poppins.SemiBold, size: 20))
                                .foregroundColor(Color.theme.customBlack)
                        }
                        
                    }
                    
                    HStack {
                        Text("detailRecipe.ingredients".localized)
                            .font(.custom(Poppins.SemiBold, size: 20))
                            .foregroundColor(Color.theme.customBlack)
                        Spacer()
                        Text(String(networkAggregateModel.recipeInformation?.extendedIngredients?.count ?? 0) + " " + "detailRecipe.items".localized)
                            .font(.custom(Poppins.Light, size: 14))
                            .foregroundColor(Color.theme.customBlack)
                    }
                    
                    
                    ForEach(networkAggregateModel.recipeInformation?.extendedIngredients ?? []) { ingredient in
                        IngredientCell(ingredient: ingredient)
                    }
                    
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton, trailing: menuButton)
                
            }
        }
        .alert(isPresented: $networkAggregateModel.showAlertInView, error: networkAggregateModel.alert) { _ in
            Button("OK", role: .cancel) {
                
            }
        } message: { error in
            Text("Code: \(error.errorCode) - \(error.errorDescription ?? "")")
        }
        .task {
            networkAggregateModel.getRecipeById(id: recipeID)
        }
    }
    
    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left").foregroundColor(Color.theme.customBlack)
        }
    }
    
    var menuButton: some View {
        Menu {
            Button("Добавить в избранное",
                   action: { print("Action 1 triggered") })
            
            Button("Поделиться",
                   action: { print("Action 2 triggered") })
        } label: {
            Image(systemName: "ellipsis").foregroundColor(Color.theme.customBlack)
        }
    }
    
    func randomBetween4and5() -> Double {
        let value = 4.0 + Double(arc4random_uniform(101)) / 100.0
        return (value * 100).rounded() / 100
    }
    
    
    func randomBetween10and300() -> Int {
        return Int(arc4random_uniform(291)) + 10
    }
    
}

struct DetailRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecipeView(recipeID: "716300")
            .environmentObject(NetworkAggregateModel(networkService: NetworkService()))
    }
}
