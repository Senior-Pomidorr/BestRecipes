//
//  ServesEditView.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-08.
//

import SwiftUI

struct ServesEditView: View {
    @Binding var servesCount: Int
    @Binding var isPresented: Bool
    let availableCookTimes: [Int] = Array(0...100)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(availableCookTimes, id: \.self) { serves in
                    Button(action: {
                        self.servesCount = serves
                        self.isPresented = false
                    }) {
                        HStack {
                            Text("\(serves)")
                            Spacer()
                            if self.servesCount == serves {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Serves Count")
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


struct ServesEditView_Previews: PreviewProvider {
    static var previews: some View {
        ServesEditView(servesCount: .constant(4), isPresented: .constant(true))
    }
}
