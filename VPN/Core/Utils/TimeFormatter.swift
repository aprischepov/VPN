//
//  TimeFormatter.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation

struct TimeFormatter {
    static func format(seconds: TimeInterval) -> String {
        let hours = Int(seconds) / 3600
        let minutes = Int(seconds) / 60 % 60
        let secs = Int(seconds) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, secs)
    }
}
