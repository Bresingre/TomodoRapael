//
//  Todo.swift
//  TodoList
//
//  Created by halm robin on 31/01/2024.
//

import Foundation

enum Category: String, CaseIterable {
    case Sport = "Sport"
    case hygiene = "hygiene"
    case lambda = "lambda"
    case relax = "relax"
    case autre = "autre"
}

struct Tasks: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var image: String
    var category: Category
    var description: String
    var date: Date
    
    
    static var testData = [
        Tasks(title: "Boire un café", isCompleted: false, image: "", category: .relax, description: "boire un café", date: Date()),
        Tasks(title: "Boire dix café", isCompleted: false, image: "", category: .relax, description: "boire dix café", date: Date()),
        Tasks(title: "Boire cent café", isCompleted: false, image: "", category: .relax, description: "boire cent café", date: Date())
    ]
}
