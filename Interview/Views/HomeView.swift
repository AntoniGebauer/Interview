//
//  HomeView.swift
//  Interview
//
//  Created by Antoni Gebauer on 19/07/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("Interview")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach (model.modules) { module in
                            
                            VStack (spacing: 20) {
                                
                                NavigationLink(
                                    destination:
                                        ContentView()
                                            .onAppear(perform: {
                                                model.beginModule(module.id)
                                            }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected) {
                                    
                                        HomeViewRow(image: module.content.image, title: module.name, description: module.content.description)
                                        
                                    }
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
