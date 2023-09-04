//
//  CustomPageTabViewStyle.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import SwiftUI

struct CustomTabBarItem: View {
    var isSelected: Bool
    
    var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 40, height: 8)
                .foregroundColor(isSelected ? Color.theme.customPink : Color.theme.customGray)
    }
}

struct CustomTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarItem(isSelected: true)
    }
}
