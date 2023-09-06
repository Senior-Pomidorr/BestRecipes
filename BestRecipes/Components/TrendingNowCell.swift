//
//  TrendingNowCell.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 28.08.2023.
//

import SwiftUI
import Kingfisher

struct TrendingNowCell: View {
    let title: String
    let subtitle: String
    let image: String
    let scoreNumber: Double
    var ingredintsCount: Int
    var receptMinutes: Int
    
    var body: some View {
        ZStack {
            KFImage(URL(string: image))
                .resizable()
                .scaledToFill()
                .background(.thinMaterial)
                .frame(width: 363, height: 220)
                .cornerRadius(20)
                .opacity(0.9)
            VStack(alignment: .leading) {
                HStack {
                    Button {
                    } label: {
                        RatingView(scoreNumber: scoreNumber)
                        
                        Text(String(scoreNumber))
                            .font(.custom(Poppins.Bold, size: 14))
                            .foregroundColor(.white)
                            .offset(x: -1)
                    }
                    .frame(width: 62, height: 28)
                    .background(.ultraThinMaterial)
                    .background(.black)
                    .cornerRadius(8)
                    .offset(y: -24)
                }
                Spacer().frame(height: 50)
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.custom(Poppins.Bold, size: 16))
                        .multilineTextAlignment(.leading)
                        .frame(width: 320, height: 50, alignment: .bottomLeading)
                        
                    HStack {
                        Text("\(ingredintsCount) Ingredients")
                        Text("| \(receptMinutes) minutes")
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

struct TrendingNowCell_Previews: PreviewProvider {
    static var previews: some View {
        TrendingNowCell(title: "How to make yam sdad dfherher eeeehte",
                        subtitle: "Subtitle",
                        image: "fetasiers",
                        scoreNumber: 5.0,
                        ingredintsCount: 9,
                        receptMinutes: 25)
    }
}
