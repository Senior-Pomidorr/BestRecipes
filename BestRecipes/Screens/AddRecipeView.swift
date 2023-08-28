//
//  AddRecipeView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct AddRecipeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("AddRecipeView")
            Button {
                dismiss()
            } label: {
                Text("Back")
            }

        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
