//
//  SavedRecipesView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct SavedRecipesView: View {
    var title: String = "How to sharwama at home"
    var subtitle: String = "Subtitle"
    var image = "Food Thumbnail"
    var autorImage = "author"
    var autorName = "Zeelicious foods"
    var scoreNumber: Double = 5.0
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .top) {
                Image(image)
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                        Text(String(scoreNumber))
                            .font(.system(.headline).bold())
                            .foregroundColor(.white)
                    }
                    .frame(width: 58, height: 27.6)
                    .background(.ultraThinMaterial)
                    .background(.black)
                    .clipShape(Capsule())
                    Spacer()
                    
                    Button {
                    } label: {
                        Image(systemName: "bookmark")
                            .frame(width: 32, height: 32)
                            .foregroundColor(.red)
                    }
                    .background(.ultraThinMaterial)
                    .background(.white)
                    .clipShape(Circle())
                }
                .padding(.top, 10)
                .padding([.leading, .trailing], 33)
            }
            VStack(alignment: .leading) {
                HStack{
                    Text(title)
                        .font(.headline)
                        .padding(.top, 2)
                    Spacer()
                    Button {
                        tapShare()
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                    }
                }
                .padding(.top, 5)
                .padding([.leading, .trailing], 30)
                HStack() {
                    Image(autorImage)
                    Text("By \(autorName)")
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 30)
            }
        }
    }
    private func tapShare() {
        print("Share button tap!")
    }
}

struct SavedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesView()
    }
}
