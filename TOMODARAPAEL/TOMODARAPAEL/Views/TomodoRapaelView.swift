//
//  ContentView.swift
//  TodoList
//
//  Created by victor vieux-melchior on 31/01/2024.
//

import SwiftUI

struct TomodoRapael: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskViewModel.tasks) { task in
                    RowView(task: task)
                        .onTapGesture {
                            taskViewModel.updateItem(task: task)
                        }
                }
                .onDelete(perform: taskViewModel.deleteItem)
                .onMove(perform: taskViewModel.moveItem)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Rappel")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TomodoRapael().environmentObject(TaskViewModel())
    }
}
