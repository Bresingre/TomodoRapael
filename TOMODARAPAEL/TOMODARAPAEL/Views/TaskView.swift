import SwiftUI

struct TaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    let tasks = Tasks.testData
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(taskViewModel.tasks) { task in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(task.category.color())
                            .frame(width: 150, height: 200)
                            .padding(10)
                            .overlay(
                                VStack {
                                    Text(task.title)
                                        .padding(2)
                                        .font(.title3)
                                        Text(task.category.rawValue)
                                        .padding(2)
                                        Text(task.date, style: .date)
                                    .padding(2)
                                    HStack {
                                        Text(task.isCompleted ? "Fait" : "Pas fait")
                                            .padding(2)
                                        Circle()
                                            .fill(task.isCompleted ? Color.white : Color.black)
                                            .frame(width: 10, height: 10)
                                    }
                                    Text(task.description)
                                        .padding(2)
                                }
                            )
                    }
                }
                .padding(10)
            }
            .navigationTitle("Tasks")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: AddTaskView().environmentObject(taskViewModel))
                }
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(TaskViewModel())
    }
}
