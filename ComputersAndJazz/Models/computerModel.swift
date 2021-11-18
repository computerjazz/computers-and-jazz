//
//  computerModel.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 11/5/21.
//

import SwiftUI

struct Computer: Codable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
}
