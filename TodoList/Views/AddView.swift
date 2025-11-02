//
//  AddView.swift
//  TodoList
//
//  Created by Uday on 28/10/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State private var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
//                    .background(.white)
                    .cornerRadius(10)
                Button(action:saveButtonPressed, label: {
                    Text("Add".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding()
        }
        .navigationTitle(Text("Add an item ✏"))
        .alert("Enter at least 3 characters", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
        
        
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert = true
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            return false
        } else {
            return true
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
        }
    }
}
