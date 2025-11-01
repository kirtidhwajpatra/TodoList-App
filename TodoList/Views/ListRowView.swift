//
//  ListRowView.swift
//  TodoList
//
//  Created by Uday on 28/10/25.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First item", isCompleted: true)
    static var item3 = ItemModel(title: "Third item", isCompleted: true)
    static var item2 = ItemModel(title: "Second item", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
            ListRowView(item: item3)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
