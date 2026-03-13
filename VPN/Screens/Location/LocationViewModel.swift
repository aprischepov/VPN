//
//  LocationViewModel.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation
import Combine

@MainActor
final class LocationViewModel: BaseViewModel {
    @Published var selectedServer: VPNServer = .germany
    @Published var connectionStatus: VPNConnectionStatus = .disconnected
    
    @Injected private var serverSelectionService: VPNServerSelectionServiceProtocol
    @Injected private var vpnService: VPNConnectionServiceProtocol
    
    override func bind() {
        super.bind()
        
        selectedServer = serverSelectionService.selectedServer
        connectionStatus = vpnService.currentStatus
        
        serverSelectionService.selectedServerPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$selectedServer)
        
        vpnService.statusPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$connectionStatus)
    }
    
    func selectServer(_ server: VPNServer) {
        serverSelectionService.selectServer(server)
    }
}
