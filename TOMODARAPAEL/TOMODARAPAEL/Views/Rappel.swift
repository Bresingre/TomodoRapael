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
        .onAppear {
            checkPendingNotifications()
        }
    }
    
    func checkPendingNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            for request in requests {
                print("Pending Notification: \(request.identifier)")
            }
        }
    }
    
    func scheduleNotificationsForPendingTasks() {
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Pending Task Reminder"
        content.sound = UNNotificationSound.default
        
        let today = Calendar.current.startOfDay(for: Date())
        
        for task in taskViewModel.tasks {
            if task.date < today && !task.isCompleted {
                content.body = "You have a pending task: \(task.title)"
                let triggerDate = Calendar.current.dateComponents([.hour, .minute, .second], from: task.date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                let request = UNNotificationRequest(identifier: task.id.uuidString, content: content, trigger: trigger)
                center.add(request) { (error) in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    }
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
