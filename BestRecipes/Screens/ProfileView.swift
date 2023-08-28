//
//  ProfileView.swift
//  BestRecipes
//
//  Created by Alexandr Rodionov on 27.08.23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack {
                    HStack {
                        Text("My Profile")
                            .font(.system(.title).bold())
                            .padding(.leading, 30)
                        Spacer()
                        Button {
                            print("Tap Settings")
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.top, 20)
                    HStack {
                        Button {
                            print("Tap avatar")
                        } label: {
                            Image("margot")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 120, height: 120)
                                .overlay(Circle().stroke(.white, lineWidth: 3))
                        }
                        .padding(.leading, 30)
                        Spacer()
                    }
                    HStack {
                        Text("My recipes")
                            .font(.system(.title).bold())
                            .padding(.top, 20)
                            .padding(.leading, 40)
                        Spacer()
                    }
                    TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                    subtitle: "Subtitle",
                                    image: "fetasiers",
                                    scoreNumber: 5.0,
                                    ingredintsCount: 9,
                                    receptMinutes: 25)
                    TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                    subtitle: "Subtitle",
                                    image: "receptes",
                                    scoreNumber: 5.0,
                                    ingredintsCount: 9,
                                    receptMinutes: 25)
                    TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                    subtitle: "Subtitle",
                                    image: "bbq2",
                                    scoreNumber: 5.0,
                                    ingredintsCount: 9,
                                    receptMinutes: 25)
                    TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                    subtitle: "Subtitle",
                                    image: "bbq",
                                    scoreNumber: 5.0,
                                    ingredintsCount: 9,
                                    receptMinutes: 25)
                    TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                    subtitle: "Subtitle",
                                    image: "fetasiers",
                                    scoreNumber: 5.0,
                                    ingredintsCount: 9,
                                    receptMinutes: 25)
                    TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                    subtitle: "Subtitle",
                                    image: "receptes",
                                    scoreNumber: 5.0,
                                    ingredintsCount: 9,
                                    receptMinutes: 25)
                    TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                    subtitle: "Subtitle",
                                    image: "bbq2",
                                    scoreNumber: 5.0,
                                    ingredintsCount: 9,
                                    receptMinutes: 25)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
