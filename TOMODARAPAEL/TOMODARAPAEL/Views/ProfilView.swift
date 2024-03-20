//
//  ProfilView.swift
//  TOMODARAPAEL
//
//  Created by joue axel on 20/03/2024.
//

import SwiftUI

struct ProfilView: View {
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
            HStack{
                Text("Lu")
                Text("Ma")
                Text("Me")
                Text("Je")
                Text("Ve")
                Text("Sa")
                Text("Di")
            }
            
            HStack{
                Text("Sport")
                Circle()
                    .frame(width: 15, height: 15)
            }
            
        }
        
        
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
