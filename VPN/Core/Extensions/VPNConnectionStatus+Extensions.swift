//
//  VPNConnectionStatus+Extensions.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

extension VPNConnectionStatus {
    var title: String {
        switch self {
        case .disconnected: Localization.Status.notConnected
        case .connecting: Localization.Status.connecting
        case .connected: Localization.Status.connected
        }
    }
    
    var color: Color {
        switch self {
        case .connected: .hex6622CC
        default: .secondary
        }
    }
    
    var iconName: String {
        switch self {
        case .connecting: "arrow.triangle.2.circlepath"
        default: "power"
        }
    }
}
