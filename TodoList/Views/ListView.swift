//
//  ListView.swift
//  TodoList
//
//  Created by Uday on 28/10/25.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first item", isCompleted: false),
        ItemModel(title: "This is the second item", isCompleted: true),
        ItemModel(title: "This is the third item", isCompleted: true)
    ]
    var body: some View {
        List{
            ForEach(items) {item in
                ListRowView(item: item)
//                Text(item.title)
                
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: {
                AddView()
            })
        )
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}
