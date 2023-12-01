//
//  ContentView.swift
//  test-api-rest
//
//  Created by Linder Anderson Hassinger Solano    on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            List(contentViewModel.spotify.items, id: \.id) { item in
                HStack {
                    AsyncImage(url: URL(string: item.images[0].url)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    Text(item.name)
                }
            }.task {
                await contentViewModel.loadData()
            }.listStyle(.inset)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
