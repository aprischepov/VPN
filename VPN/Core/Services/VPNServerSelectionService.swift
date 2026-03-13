//
//  VPNServerSelectionService.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation
import Combine

protocol VPNServerSelectionServiceProtocol {
    var selectedServerPublisher: AnyPublisher<VPNServer, Never> { get }
    var selectedServer: VPNServer { get }
    
    func selectServer(_ server: VPNServer)
}

final class VPNServerSelectionService: VPNServerSelectionServiceProtocol {
    private let selectedServerSubject = CurrentValueSubject<VPNServer, Never>(.germany)
    
    var selectedServerPublisher: AnyPublisher<VPNServer, Never> {
        selectedServerSubject.eraseToAnyPublisher()
    }
    
    var selectedServer: VPNServer {
        selectedServerSubject.value
    }
    
    func selectServer(_ server: VPNServer) {
        selectedServerSubject.send(server)
    }
}
