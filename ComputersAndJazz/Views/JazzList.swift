//
//  JazzList.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 10/21/21.
//

import SwiftUI

struct JazzList: View {
    @EnvironmentObject var jazzModelData: JazzModelData
    
    var body: some View {
        List(jazzModelData.artists) { artist in
            NavigationLink(
                destination: JazzDetail(
                    artistName: artist.name,
                    imageUrl: artist.image.first?.url ?? ""

                ),
                label: {
                    Text(artist.name)
                        .font(.headline)
                })



        }
        .navigationTitle("Jazz")
    }
}

struct JazzList_Previews: PreviewProvider {
    static var previews: some View {
        JazzList()
            .environmentObject(JazzModelData())
    }
}

