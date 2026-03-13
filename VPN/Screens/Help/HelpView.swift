//
//  HelpView.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            header
            content
        }
        .padding(24)
        .frame(width: 400, height: 400, alignment: .top)
        .background(.background)
    }
    
    private var header: some View {
        HStack {
            Text(Localization.Titles.helpTitle)
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
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            HelpItem(
                icon: "power",
                title: "Connection",
                description: "Click the power button to connect or disconnect from VPN"
            )
            
            HelpItem(
                icon: "map",
                title: "Choose Server",
                description: "Tap the server card to select a different location"
            )
            
            HelpItem(
                icon: "gearshape",
                title: "Settings",
                description: "Access app preferences from the toolbar"
            )
        }
        .padding(.vertical, 16)
    }
}

struct HelpItem: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundStyle(.hex6622CC)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(description)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HelpView()
}
