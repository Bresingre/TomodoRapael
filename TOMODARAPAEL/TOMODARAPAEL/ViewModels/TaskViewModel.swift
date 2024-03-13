//
//  TodoViewModel.swift
//  TodoList
//
//  Created by vieux-melchior victor on 07/02/2024.
//

import Foundation

class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Tasks] = []
    
    init() {
        getTasks()
    }
    
    func getTasks(){
        tasks.append(contentsOf: Tasks.testData)
    }
    
    func addItem(title: String, image: String, category: Category, description: String, date: Date){
        let newTask = Tasks(title: title, isCompleted: false, image: image, category: category, description: description, date: date)
        tasks.append(newTask)
    }
    
    func deleteItem(indexSet: IndexSet){
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(task: Tasks){
        for (index, td) in tasks.enumerated(){
            if (td.id == task.id) {
                tasks[index].isCompleted.toggle()
            }
        }
    }
}
