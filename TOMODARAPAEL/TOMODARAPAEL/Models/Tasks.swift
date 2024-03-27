//
//  Todo.swift
//  TodoList
//
//  Created by halm robin on 31/01/2024.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case sport = "sport"
    case hygiene = "hygiene"
    case lambda = "lambda"
    case relax = "relax"
    case autre = "autre"
    
    func color() -> Color {
            switch self {
            case .sport:
                return Color.blue
            case .hygiene:
                return Color.green
            case .lambda:
                return Color.purple
            case .relax:
                return Color.orange
            case .autre:
                return Color.gray
            }
        }
    
    var id: String {self.rawValue}
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
        Tasks(title: "Boire un café", isCompleted: false, image: "", category: .relax, description: "boire un café", date: Calendar.current.date(byAdding: .hour, value: 1, to: Calendar.current.date(byAdding: .minute, value: 1, to: Date())!)!),
        Tasks(title: "Dormir", isCompleted: false, image: "", category: .hygiene, description: "ne pas fondre", date: Calendar.current.date(byAdding: .hour, value: 1, to: Calendar.current.date(byAdding: .minute, value: 1, to: Date())!)!),
        Tasks(title: "Lambda", isCompleted: false, image: "", category: .lambda, description: "swimming", date: Calendar.current.date(byAdding: .hour, value: 1, to: Calendar.current.date(byAdding: .minute, value: 1, to: Date())!)!),
        Tasks(title: "Lambda", isCompleted: false, image: "", category: .autre, description: "swimming", date: Calendar.current.date(byAdding: .hour, value: 1, to: Calendar.current.date(byAdding: .minute, value: 1, to: Date())!)!),
        Tasks(title: "Lambda", isCompleted: false, image: "", category: .sport, description: "swimming", date: Calendar.current.date(byAdding: .hour, value: 1, to: Calendar.current.date(byAdding: .minute, value: 1, to: Date())!)!)
    ]
}

