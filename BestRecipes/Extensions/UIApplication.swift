//
//  UIApplication.swift
//  BestRecipes
//
//  Created by Artem on 29.08.2023.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
