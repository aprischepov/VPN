//
//  SheetType.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

enum SheetType: String, Identifiable, CaseIterable {
    case settings
    case help
    case location
    
    var id: String { rawValue }
    
    var view: some View {
        switch self {
        case .settings: AnyView(SettingsView())
        case .help: AnyView(HelpView())
        case .location: AnyView(LocationView())
        }
    }
}
