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
        formatter.dateFormat = "dd/MM/YY"
        return formatter
    }()
    
    var body: some View {
        VStack{
            HStack{
                Text(task.title)
                Spacer()
            }
            HStack {
                Text(dateFormatter.string(from: task.date))
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                    .foregroundColor(task.isCompleted ? .green : .red)
                
            }
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
