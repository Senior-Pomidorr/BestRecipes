//
//  seeAllButton.swift
//  BestRecipes
//
//  Created by Artem on 29.08.2023.
//

import SwiftUI

struct SeeAllButton: View {
    var body: some View {
        HStack {
            Text("See all")
                .foregroundColor(Color.theme.customPink)
                .fontWeight(.semibold)
            Image(systemName: "arrow.right")
                .foregroundColor(.theme.customGray)
                .padding(.trailing, 16)
        }
    }
}

struct SeeAllButton_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllButton()
    }
}
