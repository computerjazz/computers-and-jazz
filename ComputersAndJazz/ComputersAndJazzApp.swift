//
//  ComputersAndJazzApp.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 10/21/21.
//

import SwiftUI

@main
struct ComputersAndJazzApp: App {
    @StateObject private var jazzModelData = JazzModelData()
    @StateObject private var computerModelData = ComputerModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(jazzModelData)
                .environmentObject(computerModelData)
        }
    }
}
