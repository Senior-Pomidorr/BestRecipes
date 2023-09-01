import SwiftUI
import Kingfisher

struct IngredientCell: View {
    @State private var isChecked: Bool = false
    
    var ingredient: ExtendedIngredient
    
    init(ingredient: ExtendedIngredient) {
        self.ingredient = ingredient
    }
        
        var body: some View {
            HStack(spacing: 8) {
                
                KFImage(URL(string: "https://spoonacular.com/cdn/ingredients_100x100/" + (ingredient.image ?? "")))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Text(ingredient.name ?? "Item")
                    .font(.custom(Poppins.Bold, size: 16))
                    .foregroundColor(Color.theme.customBlack)
                
                Spacer()
                
                Text(String(ingredient.measures?.metric?.amount ?? 0) + " " + (ingredient.measures?.metric?.unitShort ?? ""))
                    .font(.custom(Poppins.Light, size: 14))
                    .foregroundColor(Color.theme.customBlack)
                
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image("check")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(isChecked ? Color.theme.customPink : Color.theme.customBlack)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .frame(height: 50)
            .padding(8)
            .background(Color.theme.сustomWhite)
            .cornerRadius(16)
            .shadow(color: Color.theme.customBlack.opacity(0.2), radius: 5, x: 0, y: 5)
        }
}

struct IngredientCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCell(ingredient: ExtendedIngredient(id: 1, aisle: "", image: "", consistency: nil, name: "", nameClean: "", original: "", originalName: "", amount: 1.0, unit: "", meta: [], measures: nil))
            .padding()
    }
}
