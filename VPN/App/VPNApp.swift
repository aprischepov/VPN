//
//  VPNApp.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

@main
struct VPNApp: App {
    init() {
        DIContainer.shared.registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .windowResizability(.contentSize)
    }
}
