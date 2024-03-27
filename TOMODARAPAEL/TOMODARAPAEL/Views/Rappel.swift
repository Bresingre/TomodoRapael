//
//  Rappel.swift
//  TOMODARAPAEL
//
//  Created by joue axel on 14/03/2024.
//
import SwiftUI
import UserNotifications

struct RappelView: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(taskViewModel.tasks.filter { Calendar.current.isDateInToday($0.date) }) { task in
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
        .onAppear {
            requestNotificationPermissions()
        }
    }
    
    func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted")
                scheduleNotificationsForPendingTasks()
            } else {
                print("Notification permission denied: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    func scheduleNotificationsForPendingTasks() {
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        
        for task in taskViewModel.tasks {
            guard !task.isCompleted else { continue } // Skip completed tasks
            
            let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Calendar.current.date(byAdding: .hour, value: -1, to: task.date)!)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            content.title = "Task Reminder"
            content.body = "You have a task due: \(task.title) at \(task.date)"
            
            let request = UNNotificationRequest(identifier: task.id.uuidString, content: content, trigger: trigger)
            
            center.add(request) { (error) in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled for task: \(task.title) at triggerdate : \(triggerDate) ,date :  \(task.date) ")
                }
            }
        }
    }
}

struct RappelView_Previews: PreviewProvider {
    static var previews: some View {
        RappelView().environmentObject(TaskViewModel())
    }
}
