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
        static let ipLabel = String(localized: "info.ip_label")
        static let mbps = String(localized: "info.mbps")
    }
    
    enum Country {
        static let germany = String(localized: "country.germany")
        static let usa = String(localized: "country.usa")
        static let japan = String(localized: "country.japan")
        static let netherlands = String(localized: "country.netherlands")
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
    
    enum Settings {
        static let autoConnect = String(localized: "settings.auto_connect")
        static let showNotifications = String(localized: "settings.show_notifications")
        static let connectionBoost = String(localized: "settings.connection_boost")
    }
    
    enum Help {
        static let connectionTitle = String(localized: "help.connection_title")
        static let connectionDescription = String(localized: "help.connection_description")
        static let serverTitle = String(localized: "help.server_title")
        static let serverDescription = String(localized: "help.server_description")
        static let settingsTitle = String(localized: "help.settings_title")
        static let settingsDescription = String(localized: "help.settings_description")
    }
}
