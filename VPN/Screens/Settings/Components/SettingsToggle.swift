//
//  SettingsToggle.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

struct SettingsToggle: View {
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(title)
                .font(.system(size: 13))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .tint(.hex6622CC)
        .toggleStyle(.switch)
        .padding(.vertical, 12)
    }
}
