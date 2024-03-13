//
//  RowView.swift
//  TodoList
//
//  Created by Vieux-Melchior Victor on 31/01/2024.
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
            .font(.title2)
            .padding(.vertical, 8)
            HStack {
                Text(dateFormatter.string(from: task.date))
                Spacer()
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                    .foregroundColor(task.isCompleted ? .white : .black)
                    .font(.title)
                Spacer()
            }
        }
        .background(task.category.color())
        .cornerRadius(10)
        .padding(.pi)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth:7)
        )
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
