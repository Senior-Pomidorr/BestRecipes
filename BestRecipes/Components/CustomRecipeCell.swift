//
//  CustomRecipeCell.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-08.
//

import SwiftUI

struct CustomRecipeCell: View {
    let title: String
    let subtitle: String
    let image: String
    let servesNumber: Int
    var ingredintsCount: Int
    var receptMinutes: Int
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .background(.thinMaterial)
                .frame(width: 363, height: 220)
                .cornerRadius(20)
                .opacity(0.9)
            VStack(alignment: .leading) {
                Spacer().frame(height: 50)
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.custom(Poppins.Bold, size: 16))
                        .multilineTextAlignment(.leading)
                        .frame(width: 320, height: 50, alignment: .bottomLeading)
                    HStack {
                        Text("\(ingredintsCount) Ingredients")
                        Text("| \(receptMinutes) minutes")
                        HStack(spacing: 0) {
                            Text("| \(servesNumber) ")
                            Image(systemName: "person.fill")
                        }
                    }
                    .font(.custom(Poppins.Medium, size: 14))
                    
                }
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3)
                .offset(x: 4, y: 20)
            }
            .offset(x: -10)
            .padding([.leading, .trailing], 10)
        }
    }
}

struct CustomRecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomRecipeCell(title: "How to make yam sdad dfherher eeeehte",
                        subtitle: "Subtitle",
                        image: "fetasiers",
                        servesNumber: 5,
                        ingredintsCount: 9,
                        receptMinutes: 25)
    }
}
