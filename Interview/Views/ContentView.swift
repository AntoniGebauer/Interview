//
//  ContentView.swift
//  Interview
//
//  Created by Antoni Gebauer on 19/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                // Confirm that currentModule is set
                if model.currentModule != nil {


                
                    ForEach(0..<model.currentModule!.content.details.count) { index in
                        NavigationLink(
                            destination:
                                ContentDetailsView()
                                    .onAppear(perform: {
                                        model.showDetail(index)
                                    }),
                            label: {
                                ContentViewRow(index: index)
                            })

                    }
                }
            }
            .accentColor(.black)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
