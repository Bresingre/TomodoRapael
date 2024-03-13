//
//  TaskView.swift
//  TOMODARAPAEL
//
//  Created by joue axel on 13/03/2024.
//

import SwiftUI

struct TaskView: View {
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(.orange)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.blue)
        }
    }
    
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
