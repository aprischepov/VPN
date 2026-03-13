//
//  HomeView.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            statusHeader
            currentServerCard
            connectionStats
            worldMap
            connectionButton
        }
        .padding(24)
        .frame(width: 400, height: 600, alignment: .top)
        .background(.background)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: { viewModel.showSheet(.help) }) {
                    Image(systemName: "questionmark.circle")
                        .imageScale(.large)
                }
                .help(Localization.Toolbar.help)
            }
            
            ToolbarItem(placement: .automatic) {
                Button(action: { viewModel.showSheet(.settings)}) {
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                }
                .help(Localization.Toolbar.settings)
            }
        }
        .sheet(item: $viewModel.presentedSheet) { item in
            item.view
        }
    }
    
    private var statusHeader: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(viewModel.connectionStatus.color)
                .frame(width: 10, height: 10)
            
            Text(viewModel.connectionStatus.title)
                .font(.system(size: 14, weight: .medium))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(viewModel.connectionStatus.color.opacity(0.1))
        .clipShape(.rect(cornerRadius: 12))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var worldMap: some View {
        Image(.map)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    private var currentServerCard: some View {
        Button(action: { viewModel.showSheet(.location) }) {
            HStack(spacing: 12) {
                Text(viewModel.selectedServer.flag)
                    .font(.system(size: 32))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.selectedServer.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.primary)
                    Text("IP: \(viewModel.selectedServer.ipAddress)")
                        .font(.system(size: 12, weight: .regular))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 4) {
                    Image(systemName: "speedometer")
                        .font(.system(size: 10))
                    Text(viewModel.selectedServer.ping)
                        .font(.system(size: 12))
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 6)
            .padding(.horizontal, 18)
            .background(.hexFFFFFF)
            .clipShape(.rect(cornerRadius: 12))
            .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
        }
        .disabled(viewModel.connectionStatus != .disconnected)
        .opacity(viewModel.connectionStatus != .disconnected ? 0.5 : 1.0)
        .buttonStyle(.plain)
    }
    
    private var connectionButton: some View {
        Button(action: { viewModel.toggleConnection() }) {
            VStack(spacing: 16) {
                Image(systemName: viewModel.connectionStatus.iconName)
                    .font(.system(size: 50, weight: .regular))
                    .foregroundStyle(.hex6622CC)
                
                Text(TimeFormatter.format(seconds: viewModel.connectionTime))
                    .foregroundStyle(.hex2A3038)
                    .font(.system(size: 14, weight: .medium))
                    .monospacedDigit()
            }
            .frame(width: 148, height: 148)
            .background(.hexFFFFFF)
            .clipShape(.circle)
            .shadow(color: .black.opacity(0.1), radius: 20, y: 10)
        }
        .buttonStyle(.plain)
        .disabled(viewModel.connectionStatus == .connecting)
    }
    
    private var connectionStats: some View {
        HStack(spacing: 0) {
            HStack(spacing: 8) {
                Image(.downloadArrow)
                HStack(spacing: 4) {
                    Text(viewModel.connectionStatus == .connected ? "21.6" : "0" )
                        .font(.system(size: 16, weight: .bold))
                    Text("MB/s")
                        .font(.system(size: 12, weight: .regular))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                Image(.uploadArrow)
                HStack(spacing: 6) {
                    Text(viewModel.connectionStatus == .connected ? "15.6" : "0")
                        .font(.system(size: 16, weight: .bold))
                    Text("MB/s")
                        .font(.system(size: 12, weight: .regular))
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    HomeView()
}
