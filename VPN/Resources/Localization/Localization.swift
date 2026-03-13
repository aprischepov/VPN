//
//  Localization.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation

enum Localization {
    enum Status {
        static let notConnected = String(localized: "status.not_connected")
        static let connecting = String(localized: "status.connecting")
        static let connected = String(localized: "status.connected")
    }
    
    enum Buttons {
        static let connect = String(localized: "button.connect")
        static let disconnect = String(localized: "button.disconnect")
        static let connecting_button = String(localized: "button.connecting")
    }
    
    enum Info {
        static let serverLocation = String(localized: "server.location")
        static let server = String(localized: "info.server")
        static let ipAddress = String(localized: "info.ip_address")
        static let connectionTime = String(localized: "info.connection_time")
    }
    
    enum Messages {
        static let selectServer = String(localized: "message.select_server")
    }
    
    enum Toolbar {
        static let settings = String(localized: "toolbar.settings")
        static let help = String(localized: "toolbar.help")
    }
    
    enum Titles {
        static let settingsTitle = String(localized: "settings.title")
        static let helpTitle = String(localized: "help.title")
    }
}
