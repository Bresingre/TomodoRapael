//
//  Rappel.swift
//  TOMODARAPAEL
//
//  Created by joue axel on 14/03/2024.
//
import SwiftUI

struct Rappel: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
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
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text("Category")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                    ForEach(Category.allCases) { category in
                        HStack {
                            Image(systemName: "largecircle.fill.circle" )
                                .foregroundColor(category.color())
                                .font(.title)
                            Text(category.rawValue)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.trailing, 10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.black, lineWidth:2)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Rappel().environmentObject(TaskViewModel())
    }
}
