//
//  BookmarksCell.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 27.08.2023.
//

import SwiftUI

struct BookmarksCell: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

