//
//  Uber_CloneApp.swift
//  Uber Clone
//
//  Created by Hamza Azhar on 2024-05-16.
//

import SwiftUI

@main
struct Uber_CloneApp: App {
    @StateObject var locationSearchViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationSearchViewModel)
        }
    }
}
