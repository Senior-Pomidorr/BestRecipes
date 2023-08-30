//
//  AddRecipeView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var recipeName: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top) {
                Text("Greate recipe")
                    .font(.custom(Poppins.SemiBold, size: 24))
                    .padding(.leading, 30)
                Spacer()
            }
                VStack() {
                    ZStack(alignment: .top) {
                        Image("bbq")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 363, height: 220)
                            .cornerRadius(20)
                        HStack {
                            Spacer()
                            Button {
                                changeRecipePhoto()
                            } label: {
                                Image("ChangePic")
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
                }
            TextField(
                "Naija lunch box ideas for work|",
                text: $recipeName
            )
            .font(.custom(Poppins.Regular, size: 14))
            .frame(height: 44)
            .textInputAutocapitalization(.words)
            .padding([.leading, .trailing], 14)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.theme.customPink, lineWidth: 1)
            )
            .padding(.horizontal, 16)
            
            
            Button {
                dismiss()
            } label: {
                Text("Back")
            }

        }
    }
    func changeRecipePhoto() {
        print("Tap change photo")
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
