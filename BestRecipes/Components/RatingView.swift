//
//  RatingView.swift
//  BestRecipes
//
//  Created by Artem on 01.09.2023.
//

import SwiftUI

struct RatingView: View {
    
    let scoreNumber: Double
    
    var body: some View {
    
            StarView.overlay(OverlayView.mask(StarView))
    }
        private var StarView: some View {
            Image("Star")
                .foregroundColor(.black)
        }
        
        private var OverlayView: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(width: CGFloat(scoreNumber)/5 * geometry.size.width)
                }
            }
        }
    }

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(scoreNumber: 3.0)
    }
}
