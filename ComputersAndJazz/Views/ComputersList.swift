//
//  ComputersList.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 10/28/21.
//

import SwiftUI

struct ComputersList: View {
    
    @EnvironmentObject var computerModelData: ComputerModelData;

    var body: some View {
        List(computerModelData.computers) { computer in
            NavigationLink(
                destination:
                    ScrollView {
                        RemoteImage(url: computer.image)
                               .aspectRatio(contentMode: .fit)
                                 .frame(width: 200)
                        
                        Text(computer.description)

                    }
                    .padding()
                    .navigationTitle(computer.name),
                label: {
                    Text(computer.name)
                        .font(.headline)
                })
        }
        .navigationTitle("Computers")
    }
}

struct ComputersList_Previews: PreviewProvider {
    static var previews: some View {
        ComputersList()
            .environmentObject(ComputerModelData())
    }
}
