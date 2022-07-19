//
//  ContentViewRow.swift
//  Interview
//
//  Created by Antoni Gebauer on 19/07/2022.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var detail: Details {
        if model.currentModule != nil && index < model.currentModule!.content.details.count {
            return model.currentModule!.content.details[index]
        } else {
            return Details(id: 0, name: "", image: "", description: "")
        }
    }
    
    var body: some View {
        
        // Detail card
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            VStack (alignment: .leading) {
                Text(detail.name)
                    .bold()

            }.padding()
        }.padding(.bottom, 5)
        
        Spacer()
    }
}
