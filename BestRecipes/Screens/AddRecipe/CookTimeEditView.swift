//
//  CookTimeEditView.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-08.
//

import SwiftUI

struct CookTimeEditView: View {
    @Binding var cookTime: Int
    @Binding var isPresented: Bool
    let availableCookTimes: [Int] = Array(0...100)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(availableCookTimes, id: \.self) { time in
                    Button(action: {
                        self.cookTime = time
                        self.isPresented = false
                    }) {
                        HStack {
                            Text("\(time) min")
                            Spacer()
                            if self.cookTime == time {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Cook Time")
            .navigationBarItems(trailing: doneButton)
        }
    }
    
    private var doneButton: some View {
        Button(action: {
            self.isPresented = false
        }) {
            Text("Done")
                .font(.body)
        }
    }
}

struct CookTimeEditView_Previews: PreviewProvider {
    static var previews: some View {
        CookTimeEditView(cookTime: .constant(20), isPresented: .constant(true))
    }
}
