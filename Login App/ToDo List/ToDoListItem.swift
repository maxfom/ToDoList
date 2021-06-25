//
//  ToDoListItem.swift
//  Login App
//
//  Created by Георгий Сабанов on 16.06.2021.
//

import Foundation

class ToDoListItem: Codable {
    
    let title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.title = title
        self.isDone = isDone
    }
    
}
