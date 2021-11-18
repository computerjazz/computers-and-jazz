//
//  JazzModelData.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 10/28/21.
//

import Foundation

final class JazzModelData: ObservableObject{
    @Published var artists: [Artist] = []
    
    init() {
        apiCall().getSimilarArtists(artistName: "Miles Davis", limit: 20, completion: { (artists) in
            self.artists = artists.sorted {
                let n1 = $0.name.components(separatedBy: " ").last ?? $0.name
                let n2 = $1.name.components(separatedBy: " ").last ?? $1.name
                return n1 < n2
            }
        })
    }

}
