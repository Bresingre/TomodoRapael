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
            
            Text("Recap hebdo")
                .font(.title2)
                .fontWeight(.bold)

            HStack {
                Text("Lu")
                    .padding(1)
                Text("Ma")
                    .padding(1)
                Text("Me")
                    .padding(1)
                Text("Je")
                    .padding(1)
                Text("Ve")
                    .padding(1)
                Text("Sa")
                    .padding(1)
                Text("Di")
                    .padding(1)
            }

            HStack {
                Text("Sport")
                    .padding(4)
                
                    Circle()
                        .frame(width: 15, height: 15)
                        .padding(4)
                    Circle()
                        .frame(width: 15, height: 15)
                        .padding(4)
                    Circle()
                        .frame(width: 15, height: 15)
                        .padding(4)
                    Circle()
                        .frame(width: 15, height: 15)
                        .padding(4)
                    Circle()
                        .frame(width: 15, height: 15)
                        .padding(4)
                    Circle()
                        .frame(width: 15, height: 15)
                        .padding(4)
                    Circle()
                        .frame(width: 15, height: 15)
                        .padding(4)
                
            }
            .padding(.trailing, 45)

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
