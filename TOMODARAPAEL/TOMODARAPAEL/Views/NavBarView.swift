//
//  NavBarView.swift
//  TOMODARAPAEL
//
//  Created by vieux-melchior victor on 20/03/2024.
//

import SwiftUI

struct RoundedSquareButton: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 60, height: 30)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}

struct CircleButton: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 50, height: 50)
            .background(Color.white)
            .foregroundColor(Color.blue)
            .clipShape(Circle())
    }
}

struct Navbar: View {
    var body: some View {
        HStack(spacing: 10) {
            Spacer()
            RoundedSquareButton(text: "Home")
            RoundedSquareButton(text: "Alarm")
            CircleButton(image: Image(systemName: "person.circle.fill"))
            RoundedSquareButton(text: "Share")
            RoundedSquareButton(text: "Pet")
            Spacer()
        }
        .padding()
        
    }
}

struct ContentView: View {
    var body: some View {
        Navbar()
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
