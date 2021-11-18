//
//  ContentView.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 10/21/21.
//

import SwiftUI

class navigationItem {
     var id = UUID()
     var label: String
     var destination: AnyView
     var symbolName: String
    
    init (label: String, destination: AnyView, symbolName: String) {
        self.label = label
        self.destination = destination
        self.symbolName = symbolName
    }
}

struct WrappedView {
     var view: AnyView
}


struct ContentView: View {
    
    var navigationItems = [navigationItem]();
    
    init() {
        self.navigationItems.append(
            navigationItem(
                label: "Computers",
                destination: AnyView(ComputersList()),
                symbolName: "desktopcomputer"
            ));
        self.navigationItems.append(
            navigationItem(
                label: "Jazz",
                destination: AnyView(JazzList()),
                symbolName: "music.note"
            ));
        self.navigationItems.append(
            navigationItem(
                label: "Gestures",
                destination: AnyView(GestureView()),
                symbolName: "hand.draw"
            ));
    }
    
    var body: some View {
        TabView {
            ForEach(navigationItems, id: \.id) { item in
                NavigationView {
                    item.destination
                }
                    .navigationTitle(item.label)
                    .tabItem{
                        Image(systemName: item.symbolName)
                        Text(item.label)
                    }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(JazzModelData())
            .environmentObject(ComputerModelData())
    }
}
