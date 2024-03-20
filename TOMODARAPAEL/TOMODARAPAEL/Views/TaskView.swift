import SwiftUI

struct TaskView: View {
    let tasks = Tasks.testData
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(tasks) { task in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(task.category.color())
                        .frame(width: 150, height: 200)
                        .padding(10)
                        .overlay(
                            VStack {
                                Text(task.title)
                                    .padding(2)
                                HStack{
                                    Text(task.category.rawValue)
                                    Text(task.date, style: .time)
                                }
                                .padding(2)
                                Text(task.isCompleted ? "Fait" : "Pas fait")
                                    .padding(2)
                                Text(task.description)
                                    .padding(2)
                            }
                        )
                }
            }
            .padding(10)
        }
    }
}



struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
