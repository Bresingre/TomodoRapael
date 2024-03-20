//
//  TaskView.swift
//  TOMODARAPAEL
//
//  Created by joue axel on 13/03/2024.
//

import SwiftUI

struct TaskView: View {
    
    var body: some View {
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(.orange)
                    .padding(10)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .padding(10)
            }
            
            
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(.gray)
                    .padding(10)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .padding(10)
            }
            
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(.gray)
                    .padding(10)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .padding(10)
            }
        }
    }
    
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
