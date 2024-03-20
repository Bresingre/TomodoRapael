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
            Text("Manurrrrrrrrrrrrrel")
            
            
            Divider()
                .background(Color.gray)
            
            Text("Succès")
                .padding(5)
            HStack{
                Image(systemName: "cup.and.saucer.fill" )
                Text("1000 café")
            }
            
            Divider()
                .background(Color.gray)
            
            Text("Recap hebdo")
                
            
        }
        
        
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
