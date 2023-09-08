//
//  AuthorCell.swift
//  BestRecipes
//
//  Created by Artem on 29.08.2023.
//

import SwiftUI

struct AutorCell: View {
    let avatar: String
    let authorName: String
    
    var body: some View {
        VStack {
            Image(avatar)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
            Text(authorName)
                .font(.custom(Poppins.SemiBold, size: 16))
                .foregroundColor(Color.theme.customBlack)
        }
    }
}

struct AutorCell_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                AutorCell(avatar: "img-test", authorName: "Artur O Brian ")
            }
            .frame(height: 200)
        }
    }
}

