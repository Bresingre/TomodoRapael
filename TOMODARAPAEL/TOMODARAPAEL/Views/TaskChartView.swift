//
//  TaskChartView.swift
//  TOMODARAPAEL
//
//  Created by joue axel on 27/03/2024.
//

import SwiftUI
import Charts

struct TaskChartView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        // Récupérer les tâches depuis taskViewModel
        let tasks = taskViewModel.tasks
        
        // Compter le nombre de tâches complétées et non complétées
        let completedTasksCount = tasks.filter { $0.isCompleted }.count
        let incompleteTasksCount = tasks.filter { !$0.isCompleted }.count
        
        // Créer le graphique avec les données
        Chart {
            BarMark(
                x: .value("Complétées", "complètes"),
                y: .value("Nombre", completedTasksCount)
            )
            BarMark(
                 x: .value("Non Complétées", "incomplètes"),
                 y: .value("Nombre", incompleteTasksCount)
            )
        }
    }
}



struct TaskChart_Previews: PreviewProvider {
    static var previews: some View {
        TaskChartView()
            .environmentObject(TaskViewModel())
    }
}


