//
//  AddRecipeView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI


struct AddRecipeView: View {
    @State private var ingredients: [Ingredient] = [Ingredient()]
    @State private var recipeName = ""
    @State private var serves = 3
    @State private var cookTime = 20
    @State private var ingredientName = ""
    @State private var quanity = ""
    @Environment(\.dismiss) var dismiss
    
    //picker
    @State private var showingImagePicker = false
    @Binding var inputImage: UIImage?
    
    //create
    @State private var myRecipesArray: [MyRecipes] = []
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack(alignment: .top) {
                    Text("Сreate recipe")
                        .font(.custom(Poppins.SemiBold, size: 24))
                        .padding(.leading, 26)
                        .padding(.top, 20)
                    Spacer()
                }
                VStack() {
                    ZStack(alignment: .top) {
                        if inputImage != nil {
                            Image(uiImage: inputImage!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 363, height: 220)
                                .cornerRadius(20)
                        } else {
                            Image("bbq")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 363, height: 220)
                                .cornerRadius(20)
                        }
                        
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
                            .sheet(isPresented: $showingImagePicker) {
                                ImagePicker(image: $inputImage)
                            }
                        }
                        .padding(.top, 8)
                        .padding([.leading, .trailing], 33)
                    }
                }
                TextField(
                    "Naija lunch box ideas for work|",
                    text: $recipeName
                )
                .font(.custom(Poppins.Regular, size: 14))
                .frame(height: 43)
                .textInputAutocapitalization(.words)
                .padding([.leading, .trailing], 14)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.theme.customPink, lineWidth: 1)
                )
                .padding(.horizontal, 16)
                
                HStack {
                    Image("Peoples")
                        .padding([.leading, .trailing], 14)
                    Text("Serves")
                        .font(.custom(Poppins.Medium, size: 16))
                    Spacer()
                    Text("\(serves)")
                        .foregroundColor(.theme.customGray)
                        .font(.custom(Poppins.Medium, size: 14))
                    
                    Button {
                        
                    } label: {
                        Image("Arrow")
                    }
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 8)
                    
                }
                .font(.custom(Poppins.Regular, size: 14))
                .frame(height: 60)
                .textInputAutocapitalization(.words)
                .background(Color.theme.neutral)
                .cornerRadius(16)
                .padding([.leading, .trailing], 16)
                
                HStack {
                    Image("Timer")
                        .padding([.leading, .trailing], 14)
                    Text("Cook time")
                        .font(.custom(Poppins.Medium, size: 16))
                    Spacer()
                    Text("\(cookTime) min")
                        .foregroundColor(.theme.customGray)
                        .font(.custom(Poppins.Medium, size: 14))
                    Button {
                        
                    } label: {
                        Image("Arrow")
                    }
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 8)
                    
                }
                .font(.custom(Poppins.Regular, size: 14))
                .frame(height: 60)
                .textInputAutocapitalization(.words)
                .background(Color.theme.neutral)
                .cornerRadius(16)
                .padding([.leading, .trailing], 16)
                
                HStack(alignment: .top) {
                    Text("Ingredients")
                        .font(.custom(Poppins.SemiBold, size: 24))
                        .padding(.leading, 30)
                    Spacer()
                }
                
                ForEach(ingredients.indices, id: \.self) { index in
                    HStack {
                        TextField(
                            "Item name",
                            text: $ingredients[index].itemName
                        )
                        .font(.custom(Poppins.Regular, size: 14))
                        .frame(width: 164,height: 43)
                        .textInputAutocapitalization(.words)
                        .padding([.leading, .trailing], 14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.theme.customGray, lineWidth: 1)
                        )
                        .padding(.leading, 16)
                        
                        TextField(
                            "Quanity",
                            text: $ingredients[index].quantity
                        )
                        .font(.custom(Poppins.Regular, size: 14))
                        .frame(height: 43)
                        .textInputAutocapitalization(.words)
                        .padding([.leading, .trailing], 14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.theme.customGray, lineWidth: 1)
                        )
                        
                        Button {
                            ingredients.append(Ingredient())
                        } label: {
                            Image("PlusButton")
                        }
                        .padding(.trailing, 18)
                    }
                }
                
                HStack {
                    TextField(
                        "Item name",
                        text: $ingredientName
                    )
                    .font(.custom(Poppins.Regular, size: 14))
                    .frame(width: 164,height: 43)
                    .textInputAutocapitalization(.words)
                    .padding([.leading, .trailing], 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.theme.customGray, lineWidth: 1)
                    )
                    .padding(.leading, 16)
                    
                    TextField(
                        "Quanity",
                        text: $quanity
                    )
                    .font(.custom(Poppins.Regular, size: 14))
                    .frame(height: 43)
                    .textInputAutocapitalization(.words)
                    .padding([.leading, .trailing], 14)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.theme.customGray, lineWidth: 1)
                    )
                    Button {
                        ingredients.removeLast()
                    } label: {
                        Image("Minus")
                    }
                    .padding(.trailing, 18)
                }
                
                HStack {
                    Button {
                        ingredients.append(Ingredient())
                    } label: {
                        Image("Plus")
                    }
                    .padding(.trailing, 12)
                    Text("Add new Ingridient")
                        .font(.custom(Poppins.SemiBold, size: 16))
                    Spacer()
                }
                .padding(.leading, 20)
                
                GeometryReader { geometry in
                    Button(action: {
                        print("Tap change photo recipe")

//                        createButtonPressed()
                        // Сделать сохранение по модели RecipeFull в узер дефаулт
                    }) {
                        Text("Create recipe")
                            .font(.custom(Poppins.SemiBold, size: 16))
                            .foregroundColor(.white)
                        
                            .frame(width: geometry.size.width - 32, height: 56)
                            .background(Color.theme.customPink)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
    func changeRecipePhoto() {
        print("Tap change photo recipe")
        showingImagePicker = true
    }
    //create
    func createButtonPressed() {
        // Ensure that the required fields are not empty
        let title = recipeName
//        guard  let image = inputImage else {
//            // Display an alert or handle the case when the required fields are empty
//            return
//        }
        // Create a new MyRecipes instance with the provided data
        let newRecipe = MyRecipes(
            id: nil, // You can assign a unique ID if needed
            title: title,
            image: "bbq", // You can save the image URL or name here
            ingredintsCount: ingredients.count,
            receptMinutes: cookTime,
            servesCount: serves
        )
        myRecipesArray.append(newRecipe)
        
        // Optionally, you can reset the form fields for the next recipe
        recipeName = ""
        inputImage = nil
        ingredients = [Ingredient()]
        serves = 3
        cookTime = 20
        
        // Dismiss the view
        dismiss()
        
        print("CUSTOM RECIPES \(myRecipesArray)")

    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView(inputImage: .constant(nil))
    }
}
