//
//  artistViewModel.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 10/28/21.
//

import Foundation

class apiCall {
    
    let baseUrl = "https://ws.audioscrobbler.com/2.0/?api_key=" + "YOUR_LAST_FM_API_KEY"
    
    func getSimilarArtists(artistName: String, limit: Int, completion:@escaping ([Artist]) -> ()) {
        let uri = "\(baseUrl)&artist=\(artistName)&format=json&method=artist.getSimilar&limit=\(limit)";
        let encodedUri = uri.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: encodedUri!) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decoded = try! JSONDecoder().decode(SimilarArtistApiResponse.self, from: data!)
        
            DispatchQueue.main.async {
                completion(decoded.similarartists.artist)
            }
        }
        .resume()
    }
    
    func getArtistInfo(artistName: String, completion:@escaping (ArtistInfo) -> ()) {
        let uri = "\(baseUrl)&artist=\(artistName)&format=json&method=artist.getInfo";
        let encodedUri = uri.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: encodedUri!) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decoded = try! JSONDecoder().decode(ArtistInfo.self, from: data!)
        
            DispatchQueue.main.async {
                completion(decoded)
            }
        }
        .resume()
    }
}
