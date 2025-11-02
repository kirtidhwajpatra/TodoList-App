//
//  TodoListApp.swift
//  TodoList
//
//  Created by Uday on 28/10/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            
        }
    }
}
