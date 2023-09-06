//
//  ProfileView.swift
//  BestRecipes
//
//  Created by Alexandr Rodionov on 27.08.23.
//

import SwiftUI

struct MyRecipes: Codable, Hashable, Identifiable {
    let id: Int?
    let title: String?
    let image: String?
    var ingredintsCount: Int?
    var receptMinutes: Int?
    var servesCount: Int?
}

struct ProfileView: View {
    
    //create recipe
    @State private var myRecipesArray: [MyRecipes] = []
    
    //picker
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack {
                    HStack {
                        Text("My profile")
                            .font(.custom(Poppins.SemiBold, size: 24))
                            .padding(.leading, 30)
                        Spacer()
                        Button {
                            print("Tap Settings")
                        } label: {
                            Image("SettingsFlat")
                                .foregroundColor(.black)
                        }
                        .padding([.trailing,], 24)
                    }
                    .padding(.top, 20)
                    HStack {
                        Button {
                            showingImagePicker = true
                        } label: {
                            if let image = inputImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                                    .overlay(Circle().stroke(.white, lineWidth: 3))
                            } else {
                                Image("margot")
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                                    .overlay(Circle().stroke(.white, lineWidth: 3))
                            }
                        }
                        .sheet(isPresented: $showingImagePicker) {
                            ImagePicker(image: $inputImage)
                        }
                        .padding(.leading, 30)
                        Spacer()
                    }
                    HStack {
                        Text("My recipes")
                            .font(.custom(Poppins.SemiBold, size: 24))
                            .padding(.top, 20)
                            .padding(.leading, 40)
                        Spacer()
                    }
                    if !myRecipesArray.isEmpty {
                        ForEach(myRecipesArray, id: \.id) { recipe in
                            TrendingNowCell(title: recipe.title ?? "Not specified",
                                            subtitle: "Subtitle",
                                            image: recipe.image ?? "",
                                            scoreNumber: 5.0,
                                            ingredintsCount: recipe.ingredintsCount ?? 0,
                                            receptMinutes: recipe.receptMinutes ?? 0)
                        }
                    } else {
                        Text("You have not added recipes yet. Try it now! 🍕🍕🍕")
                            .font(.custom(Poppins.SemiBold, size: 24))
                            .padding(.top, 50)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 10)
                    }
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
