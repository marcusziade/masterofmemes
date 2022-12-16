//
//  HomeView.swift
//  masterofmemes
//
//  Created by Marcus Ziadé on 16.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var model: MemesVM
    
    var body: some View {
        switch model.state {
            
        case .loading:
            ProgressView()
                .progressViewStyle(.linear)
            
        case .error(message: let message):
            Text(message)
            
        case .result(memes: let memes):
            NavigationView {
                MemesListView(memes: memes)
                    .navigationTitle("Memes")
                    .searchable(text: $model.searchQuery)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView(model: MemesVM.mock)
            .preferredColorScheme(.dark)
    }
}
