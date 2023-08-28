//
//  TrendingNowCell.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 28.08.2023.
//

import SwiftUI

struct TrendingNowCell: View {
    let title: String
    let subtitle: String
    let image: String
    let scoreNumber: Double
    var ingredintsCount: Int
    var receptMinutes: Int
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 363, height: 220)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                            .offset(x: 2, y: -0.5)
                        Text(String(scoreNumber))
                            .font(.system(.headline).bold())
                            .foregroundColor(.white)
                            .offset(x: -2)
                    }
                    .frame(width: 62, height: 28)
                    .background(.ultraThinMaterial)
                    .background(.black)
                    .cornerRadius(8)
                }
                .offset(y: -40)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.system(.title2).bold())
                    HStack {
                        Text("\(ingredintsCount) Ingredients")
                        Text("| \(receptMinutes) minutes")
                    }
                    .font(.system(.headline))
                }
                .foregroundColor(.white)
                .offset(y: 30)
            }
            .offset(x: -10)
            .padding([.leading, .trailing], 10)
        }
    }
}

struct TrendingNowCell_Previews: PreviewProvider {
    static var previews: some View {
        TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                        subtitle: "Subtitle",
                        image: "fetasiers",
                        scoreNumber: 5.0,
                        ingredintsCount: 9,
                        receptMinutes: 25)
    }
}
