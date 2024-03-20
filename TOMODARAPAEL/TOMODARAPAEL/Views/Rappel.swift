//
//  Rappel.swift
//  TOMODARAPAEL
//
//  Created by joue axel on 14/03/2024.
//
import SwiftUI

struct RappelView: View {
    
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
                
                VStack(alignment: .listRowSeparatorLeading) {
                    Text("Category")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                    ForEach(Category.allCases) { category in
                        HStack {
                            Image(systemName: "largecircle.fill.circle" )
                                .foregroundColor(category.color())
                                .font(.title)
                            Text(category.rawValue)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.trailing, 10)
                }
                .padding(5)
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

struct RappelView_Previews: PreviewProvider {
    static var previews: some View {
        RappelView().environmentObject(TaskViewModel())
    }
}
