//
//  AddView.swift
//  TodoList
//
//  Created by Uday on 28/10/25.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.gray).opacity(0.2))
                    .cornerRadius(10)
                Button {
                    
                } label: {
                    Text("Add".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding()
        }
        .navigationTitle(Text("Add an item ✏✛"))
        
        
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
