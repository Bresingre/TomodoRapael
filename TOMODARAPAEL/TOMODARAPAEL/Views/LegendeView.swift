//
//  LegendeView.swift
//  TOMODARAPAEL
//
//  Created by vieux-melchior victor on 13/03/2024.
//

import SwiftUI

struct LegendeView: View {
    
    let category: Category
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "largecircle.fill.circle" )
                    .foregroundColor(category.color())
                    .font(.title)
                Text(category.rawValue)
                Spacer()
            }
            .font(.title2)
            .padding(.vertical, 8)
            HStack {
                
                Spacer()
            }
        }
    }
}

struct LegendeView_Previews: PreviewProvider {
    static var previews: some View {
        LegendeView(category: .relax)
            .previewLayout(.sizeThatFits)
        LegendeView(category: .sport)
            .previewLayout(.sizeThatFits)
    }
}
