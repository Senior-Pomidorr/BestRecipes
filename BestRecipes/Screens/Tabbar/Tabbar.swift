//
//  Tabbar.swift
//  BestRecipes
//
//  Created by Alexandr Rodionov on 27.08.23.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                // Content View
                Text("Home")
                Spacer()
                // Tabbar
                HStack {
                    //Tabbar items
                    // Test 1 item
                    VStack {
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 5, height: geometry.size.height / 28)
                            .padding(.top, 10)
                        Text("Home")
                            .font(.footnote)
                        Spacer()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 8)
                .background(Color.theme.сustomWhite)
                .shadow(radius: 2)
            }
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
