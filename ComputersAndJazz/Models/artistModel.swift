//
//  artistModel.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 10/28/21.
//

import Foundation

struct ArtistImage: Codable, Equatable {
    let url: String
    let size: String
    
    private enum CodingKeys : String, CodingKey { case url = "#text", size = "size" }
}

struct Artist: Codable, Identifiable {
    let id = UUID()
    let name: String
    let match: String
    let url: String
    let image: [ArtistImage]
}


struct ArtistBio: Codable {
    let summary: String
    let content: String
}

struct ArtistDetail: Codable {
    let name: String
    let bio: ArtistBio
}

struct ArtistInfo: Codable {
    let artist: ArtistDetail
}

struct SimilarArtists: Codable {
    let artist: [Artist]
}

struct SimilarArtistApiResponse: Codable {
    let similarartists: SimilarArtists
}
