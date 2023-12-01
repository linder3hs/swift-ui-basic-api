//
//  ContentViewModel.swift
//  test-api-rest
//
//  Created by Linder Anderson Hassinger Solano    on 1/12/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var spotify: Spotify = Spotify(href: "", items: [Items]())
    
    func loadData() async {
        guard let url = URL(string: "https://spotify-api-lac-kappa.vercel.app/api/playlist") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoder = try? JSONDecoder().decode(Spotify.self, from: data) {
                DispatchQueue.main.async(execute: {
                    self.spotify = decoder
                })
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
