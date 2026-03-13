//
//  HomeViewModel.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: BaseViewModel {
    @Published var presentedSheet: SheetType?
    @Published private(set) var connectionStatus: VPNConnectionStatus = .disconnected
    @Published private(set) var selectedServer: VPNServer = .germany
    @Published private(set) var connectionTime: TimeInterval = 0
    
    private var timerCancellable: AnyCancellable?
    private var connectionStartTime: Date?
    
    @Injected private var vpnService: VPNConnectionServiceProtocol
    @Injected private var serverSelectionService: VPNServerSelectionServiceProtocol
    
    override func bind() {
        super.bind()
        
        vpnService.statusPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                self?.connectionStatus = status
                self?.handleStatusChange(status)
            }
            .store(in: &cancellable)
        
        serverSelectionService.selectedServerPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$selectedServer)
    }
}

extension HomeViewModel {
    func toggleConnection() {
        Task {
            do {
                switch connectionStatus {
                case .disconnected:
                    try await vpnService.connect(to: selectedServer)
                case .connected:
                    try await vpnService.disconnect()
                case .connecting:
                    break
                }
            } catch {
                logger.log("Connection error: \(error.localizedDescription)")
            }
        }
    }
    
    func showSheet(_ sheet: SheetType) {
        presentedSheet = sheet
    }
}

private extension HomeViewModel {
    func handleStatusChange(_ status: VPNConnectionStatus) {
        switch status {
        case .connected:
            startConnectionTimer()
        case .disconnected, .connecting:
            stopConnectionTimer()
        }
    }
    
    func startConnectionTimer() {
        connectionStartTime = Date()
        connectionTime = 0
        
        timerCancellable = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self,
                        let startTime = self.connectionStartTime else { return }
                
                self.connectionTime = Date().timeIntervalSince(startTime)
            }
    }
    
    func stopConnectionTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
        connectionTime = 0
        connectionStartTime = nil
    }
}
