//
//  PopularCategoryCell.swift
//  BestRecipes
//
//  Created by Artem on 28.08.2023.
//

import SwiftUI
import Kingfisher

struct PopularCategoryCell: View {
    
    let width, height: CGFloat
    let imageName, tabName, time: String
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(Color.theme.customGray.opacity(0.2))
                .frame(width: width, height: 0.8 * height)
                .offset(y: 0.37 * width)
            VStack(spacing: 0) {
                KFImage(URL(string:imageName))
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 0.8 * width, height: 0.8 * width)
                    .padding(.bottom, 0.02*height)
                Text(tabName)
                    .font(.custom(Poppins.Medium, size: 18))
                    .foregroundColor(Color.theme.customBlack)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.6)
                    .padding(.bottom, 16)
                    .frame(width: 0.9*width, height: 0.25 * height)
                Spacer()
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(time)
                            .font(.body)
                    }
                    .padding(.leading, 4)
                    Spacer()
                    Image("save")
                        .onTapGesture {
                    #warning("Add to favorite function here")
                        }
                }
                .padding(.bottom)
            }
        }
        .frame(width: width, height: height)
    }
}

struct PopularCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                PopularCategoryCell(width: 150, height: 240, imageName: "img-test", tabName: "Chicken and vegetable wrap", time: "5 мин")
                PopularCategoryCell(width: 150, height: 240, imageName: "img-test", tabName: "Chicken", time: "50000 мин")
                PopularCategoryCell(width: 150, height: 240, imageName: "img-test", tabName: "Chicken and vegetable wrap Chicken and vegetable", time: "5 мин")
                PopularCategoryCell(width: 150, height: 240, imageName: "img-test", tabName: "Chicken", time: "5 мин" )
                PopularCategoryCell(width: 150, height: 240, imageName: "img-test", tabName: "Chicken and vegetable wrap", time: "5 мин")
            }
        }
        .padding()
    }
}
