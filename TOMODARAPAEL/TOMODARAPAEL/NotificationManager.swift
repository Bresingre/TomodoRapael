//
//  NotificationManager.swift
//  TOMODARAPAEL
//
//  Created by vieux-melchior victor on 27/03/2024.
//

import Foundation
import UserNotifications

class NotificationManager {
    static func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted")
                scheduleNotificationsForPendingTasks()
            } else {
                print("Notification permission denied: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    static func scheduleNotificationsForPendingTasks() {
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        
        let taskViewModel = TaskViewModel.shared
        
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
