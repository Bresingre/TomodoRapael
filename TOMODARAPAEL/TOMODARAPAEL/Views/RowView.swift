//
//  RowView.swift
//  TodoList
//
//  Created by halm robin on 31/01/2024.
//

import SwiftUI

struct RowView: View {
    
    let task: Tasks
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY/MM/dd"
        return formatter
    }()
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .green : .red)
            Text(dateFormatter.string(from: task.date)) // Using dateFormatter here
            Text(task.title)
            
            Spacer()
            
            Text(task.category.rawValue)
                .font(.footnote)
                .padding(3)
                .foregroundStyle(Color(.systemGray2))
                .frame(minWidth: 62)
                .overlay(
                    Capsule().stroke(Color(.systemGray2),
                            lineWidth:0.75)
                )
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(task: Tasks.testData[0])
            .previewLayout(.sizeThatFits)
        RowView(task: Tasks.testData[1])
            .previewLayout(.sizeThatFits)
    }
}
