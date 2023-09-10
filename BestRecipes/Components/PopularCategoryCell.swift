//
//  PopularCategoryCell.swift
//  BestRecipes
//
//  Created by Artem on 28.08.2023.
//

import SwiftUI
import Kingfisher

struct PopularCategoryCell: View {
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    let width, height: CGFloat
    @State var recipe: BookmarkRecipe
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
//                    .scaledToFil()
                    .clipShape(Circle())
                    .frame(width: 0.8 * width, height: 0.8 * width)
                    .padding(.bottom, 0.02*height)
                Text(tabName)
                    .font(.custom(Poppins.Medium, size: 18))
                    .foregroundColor(Color.theme.customBlack)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.6)
                    .padding(.bottom, 16)
                    .frame(width: 0.9 * width, height: 0.25 * height)
                Spacer()
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.custom(Poppins.Medium, size: 14))
                            .foregroundColor(Color.theme.customBlack)
                        Text(time)
                            .font(.custom(Poppins.Medium, size: 14))
                            .foregroundColor(Color.theme.customBlack)
                    }
                    .padding(.leading, 4)
                    Spacer()
                    Image(recipe.isBookmarked ? "Bookmark" : "BookmarkCancel")
                        .frame(width: 24, height: 24)
                        .foregroundColor(.red)
                        .background(.ultraThinMaterial)
                        .background(.white)
                        .clipShape(Circle())
                        .onTapGesture {
                            addBookmark()
                        }
                }
                .padding(.horizontal, 10)
                .padding(.bottom)
            }
        }
        .frame(width: width, height: height)
    }
    
    private func addBookmark() {
        if recipe.isBookmarked {
            if let index = networkAggregateModel.bookmarkedRecipes?.firstIndex(where: { $0.id == recipe.id }) {
                networkAggregateModel.bookmarkedRecipes?.remove(at: index)
                UserDefaultService.shared.saveStructs(structs: networkAggregateModel.bookmarkedRecipes ?? [], forKey: "Bookmarks")
                removeBookmark()
            }
        } else {
            let bookmark = BookmarkRecipe(id: recipe.id, title: recipe.title, image: recipe.image, isBookmarked: true)
            networkAggregateModel.bookmarkedRecipes?.append(bookmark)
            UserDefaultService.shared.saveStructs(structs: networkAggregateModel.bookmarkedRecipes ?? [], forKey: "Bookmarks")

        }
        recipe.isBookmarked.toggle()
        recipe.isBookmarked ? print("Add bookmark") : print("Cancel bookmark")
    }

    private func removeBookmark() {
        if recipe.isBookmarked == false {
            UserDefaultService.shared.removeData(forKey: "Bookmarks")
        }
    }
}

struct PopularCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                PopularCategoryCell(width: 150, height: 240, recipe: BookmarkRecipe(title: "", image: "", isBookmarked: false), imageName: "img-test", tabName: "Chicken and vegetable wrap", time: "5 мин")
                PopularCategoryCell(width: 150, height: 240, recipe: BookmarkRecipe(title: "", image: "", isBookmarked: false), imageName: "img-test", tabName: "Chicken", time: "50000 мин")
                PopularCategoryCell(width: 150, height: 240, recipe: BookmarkRecipe(title: "", image: "", isBookmarked: false), imageName: "img-test", tabName: "Chicken and vegetable wrap Chicken and vegetable", time: "5 мин")
                PopularCategoryCell(width: 150, height: 240, recipe: BookmarkRecipe(title: "", image: "", isBookmarked: false), imageName: "img-test", tabName: "Chicken", time: "5 мин" )
                PopularCategoryCell(width: 150, height: 240, recipe: BookmarkRecipe(title: "", image: "", isBookmarked: false), imageName: "img-test", tabName: "Chicken and vegetable wrap", time: "5 мин")
            }
        }
        .padding()
    }
}
