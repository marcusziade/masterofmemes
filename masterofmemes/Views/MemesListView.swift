//
//  MemesListView.swift
//  masterofmemes
//
//  Created by Marcus Ziadé on 16.12.2022.
//

import SwiftUI

struct MemesListView: View {
    
    let memes: [Meme]
    
    var body: some View {
        List(memes) { meme in
            HStack {
                Text(meme.name)
                    .font(.headline)
                Spacer()
                AsyncImage(url: meme.url, content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                }, placeholder: {
                    ProgressView()
                })
                .scaledToFill()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(8)
            }
        }
    }
}

struct MemesListView_Previews: PreviewProvider {
    
    static var previews: some View {
        MemesListView(memes: MemeService().memesResponseMock.memes)
            .preferredColorScheme(.dark)
    }
}
