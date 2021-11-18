//
//  JazzDetail.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 11/5/21.
//

import SwiftUI

struct JazzDetail: View {
    
    var artistName: String
    var imageUrl: String
    
    @State var bio: String = "";
    
    var body: some View {
        ScrollView {
           RemoteImage(url: imageUrl)
                  .aspectRatio(contentMode: .fit)
                    .frame(width: 200)

                Text(bio)
                    .padding()
                    .onAppear{
                        apiCall().getArtistInfo(artistName: artistName, completion: { (artistInfo) in
                            self.bio = artistInfo.artist.bio.summary;
                        });
                    }


        }
        .navigationTitle(artistName)
    }
}

struct JazzDetail_Previews: PreviewProvider {
    
    static let jazzModelData = JazzModelData()

    static var previews: some View {
        JazzDetail(
            artistName: "Miles Davis",
            imageUrl: "https://cdn.britannica.com/22/7922-004-E6D87AB4/Miles-Davis-1969.jpg"
        )
    }
}
