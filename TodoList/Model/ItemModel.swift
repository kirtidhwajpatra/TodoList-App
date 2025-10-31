//
//  ItemModel.swift
//  TodoList
//
//  Created by Uday on 29/10/25.
//

import Foundation


//Immutatble Struct
struct ItemModel: Identifiable {
    var id: String
    let title : String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

