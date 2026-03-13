//
//  SettingsView.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage(AppConstants.StringKey.autoConnect) private var autoConnect = false
    @AppStorage(AppConstants.StringKey.notifications) private var showNotifications = false
    @AppStorage(AppConstants.StringKey.boostKey) private var connectionBoost = false
    
    var body: some View {
        VStack(spacing: 20) {
            header
            settingsGroup
        }
        .padding(24)
        .frame(width: 400, height: 300, alignment: .top)
        .background(.background)
    }
    
    private var header: some View {
        HStack {
            Text(Localization.Titles.settingsTitle)
                .font(.system(size: 18, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.secondary)
            }
            .buttonStyle(.plain)
        }
    }
    
    private var settingsGroup: some View {
        VStack(spacing: 0) {
            SettingsToggle(
                title: "Auto-connect on startup",
                isOn: $autoConnect
            )
            Divider().padding(.leading, 20)
            SettingsToggle(
                title: "Show notifications",
                isOn: $showNotifications
            )
            Divider().padding(.leading, 20)
            SettingsToggle(
                title: "Connection boost",
                isOn: $connectionBoost
            )
        }
    }
}

#Preview {
    SettingsView()
}
