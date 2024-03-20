//
//  NavBarView.swift
//  TOMODARAPAEL
//
//  Created by vieux-melchior victor on 20/03/2024.
//

import SwiftUI

struct RoundedSquareButton: View {
    var text: String
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
                .frame(width: 60, height: 30)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

struct CircleButton: View {
    var image: Image
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            image
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color.white)
                .foregroundColor(Color.blue)
                .clipShape(Circle())
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Navbar()
        }
    }
}

struct Navbar: View {
    var body: some View {
        HStack(spacing: 10) {
            Spacer()
            RoundedSquareButton(text: "Home", destination: AnyView(Rappel()))
            RoundedSquareButton(text: "Alarm", destination: AnyView(TaskView()))
            CircleButton(image: Image(systemName: "person.circle.fill"), destination: AnyView(ProfilView()))
            RoundedSquareButton(text: "Share", destination: AnyView(ShareView()))
            RoundedSquareButton(text: "Pet", destination: AnyView(PetView()))
            Spacer()
        }
        .padding()
    }
}

struct ShareView: View {
    var body: some View {
        Text("Share View")
    }
}

struct PetView: View {
    var body: some View {
        Text("Pet View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
