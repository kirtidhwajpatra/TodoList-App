//
//  ItemModel.swift
//  TodoList
//
//  Created by Uday on 29/10/25.
//

import Foundation


struct ItemModel: Identifiable {
    var id: String = UUID().uuidString
    let title : String
    let isCompleted: Bool
}
