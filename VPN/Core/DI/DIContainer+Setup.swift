//
//  DIContainer+Setup.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation

extension DIContainer {
    func registerDependencies() {
        register { LoggerService.shared as LoggerServiceProtocol }
        register { VPNConnectionService() as VPNConnectionServiceProtocol }
        register { VPNServerSelectionService() as VPNServerSelectionServiceProtocol }
    }
}
