//
//  ContentDetailsView.swift
//  Interview
//
//  Created by Antoni Gebauer on 19/07/2022.
//

import SwiftUI

struct ContentDetailsView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        GeometryReader { geo in
            
            VStack (spacing: 20){
                
                Image(systemName: model.currentDetail?.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.3, alignment: .center)
                
                Text(model.currentDetail?.name ?? "")
                    .bold()
                    .font(.largeTitle)
                
                Text(model.currentDetail?.description ?? "")
                    .font(.title)
            }.navigationTitle("Details")
            .padding()
        }
    }
}

struct ContentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailsView()
    }
}
