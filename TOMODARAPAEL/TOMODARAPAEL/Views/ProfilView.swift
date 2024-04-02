//
//  ProfilView.swift
//  TOMODARAPAEL
//
//  Created by joue axel on 20/03/2024.
//

import SwiftUI

struct ProfilView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Manurrrrrrrrrrrrrel")
                .padding(8)
                .font(.title2)
                .fontWeight(.bold)
            
            
            Divider()
                .background(Color.gray)
            
            Text("Succès")
                .font(.title2)
                .fontWeight(.bold)
            HStack{
                Image(systemName: "cup.and.saucer.fill" )
                Text("1000 café")
            }
            .padding(8)
            
            Divider()
                .background(Color.gray)
            
            Text("Recap journalier")
                .font(.title2)
                .fontWeight(.bold)

            TaskChartView()
                .environmentObject(taskViewModel)
                .padding()
            
        }
        
        .onAppear {
            NotificationManager.requestNotificationPermissions()
            NotificationManager.scheduleNotificationsForPendingTasks()
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
            .environmentObject(TaskViewModel())
    }
}
