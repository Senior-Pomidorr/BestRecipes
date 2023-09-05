//
//  CustobBackButton.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 04.09.2023.
//

import SwiftUI

struct CustomBackButton: View {
    // MARK: - States&Properties
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - UI
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss() 
        }) {
            Image("BackButton")
                .font(.title)
                .foregroundColor(.black)
        }
    }
}


