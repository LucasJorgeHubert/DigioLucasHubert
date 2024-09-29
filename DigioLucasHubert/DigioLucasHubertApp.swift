//
//  DigioLucasHubertApp.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import SwiftUI

@main
struct DigioLucasHubertApp: App {
    var body: some Scene {
        WindowGroup {
            let homeViewModel = DependencyContainer.shared.provideHomeViewModel()
            HomeView(viewModel: homeViewModel)
        }
    }
}
