//
//  VPNConnectionService.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation
import Combine

enum VPNConnectionStatus {
    case disconnected
    case connecting
    case connected
}

enum VPNServer: String, CaseIterable {
    case germany
    case usa
    case japan
    case netherlands
    
    var name: String {
        switch self {
        case .germany: "Germany"
        case .usa: "USA"
        case .japan: "Japan"
        case .netherlands: "Netherlands"
        }
    }
    
    var flag: String {
        switch self {
        case .germany: "🇩🇪"
        case .usa: "🇺🇸"
        case .japan: "🇯🇵"
        case .netherlands: "🇳🇱"
        }
    }
}

protocol VPNConnectionServiceProtocol {
    var statusPublisher: AnyPublisher<VPNConnectionStatus, Never> { get }
    var currentStatus: VPNConnectionStatus { get }
    
    func connect(to server: VPNServer) async throws
    func disconnect() async throws
}

final class VPNConnectionService: VPNConnectionServiceProtocol {
    @Injected private var logger: LoggerServiceProtocol
    
    var statusPublisher: AnyPublisher<VPNConnectionStatus, Never> {
        statusSubject.eraseToAnyPublisher()
    }
    
    var currentStatus: VPNConnectionStatus {
        statusSubject.value
    }
    
    private let statusSubject = CurrentValueSubject<VPNConnectionStatus, Never>(.disconnected)
}

extension VPNConnectionService {
    func connect(to server: VPNServer) async throws {
        logger.log("Starting connection to \(server.name)")
        statusSubject.send(.connecting)
        
        try await Task.sleep(for: .seconds(2))
        
        statusSubject.send(.connected)
        logger.log("Connected to \(server.name)")
    }
    
    func disconnect() async throws {
        logger.log("Disconnecting from VPN")
        
        try await Task.sleep(for: .seconds(2))
        
        statusSubject.send(.disconnected)
        logger.log("Disconnected from VPN")
    }
}
