//
//  RecentRecipeCell.swift
//  BestRecipes
//
//  Created by Artem on 29.08.2023.
//
import SwiftUI
import Kingfisher

struct RecentsRecipeCell: View {
    
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    let title: String
    let subtitle: String
    let image: String
    let autorImage: String
    let autorName: String
    let scoreNumber: Double
    @State var recipe: BookmarkRecipe
    var widthBackground: CGFloat
    var heightBackground: CGFloat
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .top) {
                KFImage(URL(string: image))
                    .resizable()
                    .scaledToFill()
                    .frame(width: widthBackground, height: heightBackground)
                    .background(.red)
                    .cornerRadius(20)
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
                    .cornerRadius(8)
                    Spacer()
                }
                .padding(.top, 8)
                .padding(.horizontal, 12)
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text(title)
                        .font(.custom(Poppins.SemiBold, size: 16))
                        .foregroundColor(.black)
                    Spacer()
                }
                .frame(width: widthBackground - 12, height: 22, alignment: .leading)
                .padding([.leading, .trailing], 20)
                
                HStack() {
                    Image(autorImage)
                    Text("By \(autorName)")
                        .font(.custom(Poppins.Light, size: 14))
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 20)
            }
        }
        .frame(width: widthBackground)
    }
}

