//
//  HomeViewRow.swift
//  Interview
//
//  Created by Antoni Gebauer on 19/07/2022.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                
                // Image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                // Text
                VStack (alignment: .center, spacing: 10) {
                    
                    // Headline
                    Text(title)
                        .bold()
                    
                    // Description
                    Text(description)
                        .font(.system(size: 12))
                        .padding(.bottom, 20)
                        
                    
                    
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "solid", title: "SOLID", description: "Acronym for the first five object-oriented design (OOD) principles by Robert C. Martin (also known as Uncle Bob")
    }
}
