//
//  SearchBarView.swift
//  BestRecipes
//
//  Created by Artem on 29.08.2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    
    @Binding var searchText: String
    
    @State var isPresented = false
    
    var body: some View {
        HStack {

            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.theme.customGray : Color.theme.customPink.opacity(0.5)
                )
            
            TextField("Search recipes", text: $searchText)
                .foregroundColor(Color.theme.customBlack)
                .disableAutocorrection(true)
                .overlay(
                    HStack(spacing: 5) {
                        Image(systemName: "xmark.circle.fill")
//                            .padding()
                            .offset(x: 10)
                            .foregroundColor(Color.theme.customGray)
                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                UIApplication.shared.endEditing()
                                searchText = ""
                            }
//                        ,alignment: .trailing
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "arrow.right.circle")
                                .offset(x: 10)
                                .foregroundColor(Color.theme.customGray)
                                .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        }
                        .buttonStyle(TapAnimation())
                        .sheet(isPresented: $isPresented) {
                            TrendingNowView(recipes: networkAggregateModel.shortRecipeListSearch, screenTitle: searchText, cuisine: nil)
                        }
                        
                    },alignment: .trailing
                )
        }
        .task {
            networkAggregateModel.searchRecipeShort(
                params: ["query" : $searchText],
                requestTag: .search)
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(
                    color: Color.theme.customGray.opacity(0.3),
                    radius: 16)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
       
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
    }
}
