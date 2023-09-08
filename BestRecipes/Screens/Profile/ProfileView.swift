//
//  ProfileView.swift
//  BestRecipes
//
//  Created by Alexandr Rodionov on 27.08.23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel

    //picker
    @State private var showingImagePicker = false
    @Binding var inputImage: UIImage?
    
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
                            //temporary 
                            UserDefaultService.shared.removeData(forKey: "myRecipes")
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
                    if networkAggregateModel.customRecipesArray != [] {
                        ForEach(networkAggregateModel.customRecipesArray!, id: \.id) { recipe in
                                CustomRecipeCell(title: recipe.title ?? "Not specified",
                                                 subtitle: "Subtitle",
                                                 imageData: recipe.imageData,
                                                 servesNumber: recipe.servesCount ?? 0,
                                                 ingredintsCount: recipe.ingredientsCount ?? 0,
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
                .onAppear {
                    networkAggregateModel.customRecipesArray = UserDefaultService.shared.getStructs(forKey: "myRecipes") ?? []
                    print("CUSTOM \(networkAggregateModel.customRecipesArray)")

                }
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(inputImage: .constant(nil))
//    }
//}
