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
                Text("Antoni Gebauer")
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
                        Spacer()
                    }
                    .accentColor(.black)
                    .padding()
                }
            }.navigationTitle("Interview App")

        }
        .navigationViewStyle(.stack) // fix for a bug which was causing NavigationView to jump back
        .onChange(of: model.currentContentSelected) { changedVaule in // fix for a bug which was causing index out of range error in ContentViewRow
            if changedVaule == nil {
                model.currentModule = nil
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
