//
//  LocationView.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

struct LocationView: View {
    @StateObject private var viewModel = LocationViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            header
            serverList
        }
        .padding(24)
        .frame(width: 400, height: 500, alignment: .top)
        .background(.background)
    }
    
    private var header: some View {
        HStack {
            Text(Localization.Info.serverLocation)
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
    
    private var serverList: some View {
        VStack(spacing: 8) {
            ForEach(VPNServer.allCases, id: \.self) { server in
                ServerRow(
                    server: server,
                    isSelected: viewModel.selectedServer == server,
                    isConnected: viewModel.connectionStatus == .connected && viewModel.selectedServer == server
                ) {
                    if viewModel.connectionStatus == .disconnected {
                        viewModel.selectServer(server)
                        dismiss()
                    }
                }
            }
        }
    }
}
