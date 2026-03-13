//
//  VPNServer+Extensions.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

extension VPNServer {
    var ping: String {
        switch self {
        case .germany: "28 ms"
        case .usa: "156 ms"
        case .japan: "203 ms"
        case .netherlands: "35 ms"
        }
    }
    
    var ipAddress: String {
        switch self {
        case .germany: "185.123.45.67"
        case .usa: "192.168.100.50"
        case .japan: "203.45.89.123"
        case .netherlands: "195.78.34.210"
        }
    }
    
    var signalColor: Color {
        return .secondary
    }
}
