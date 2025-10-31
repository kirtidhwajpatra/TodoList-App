//
//  ListView.swift
//  TodoList
//
//  Created by Uday on 28/10/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List{
            ForEach(listViewModel.items) {item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
//                Text(item.title)
                
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
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

}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
