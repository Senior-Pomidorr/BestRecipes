//
//  BookmarksCell.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 27.08.2023.
//

import SwiftUI

struct BookmarksCell: View {
    @State private var isBookmarked = false
    let title: String
    let subtitle: String
    let image: String
    let autorImage: String
    let autorName: String
    let scoreNumber: Double
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .top) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 363, height: 220)
                    .cornerRadius(20)
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
                    Spacer()
                    
                    Button {
                        addBookmark()
                    } label: {
                        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
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
                    Spacer()
                    Button {
                        tapShare()
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                    }
                }
                .padding(.top, 6)
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
        .padding(.top, 20)
    }
    private func tapShare() {
        print("Share button tap!")
    }
    private func addBookmark() {
        isBookmarked.toggle()
        isBookmarked ?
        print("Add bookmark") : print("Cancel bookmark")
    }
}

struct BookmarksCell_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksCell(title: "How to sharwama at home",
                      subtitle: "Subtitle",
                      image: "receptes",
                      autorImage: "author",
                      autorName: "Zeelicious foods",
                      scoreNumber: 5.0)
    }
}


