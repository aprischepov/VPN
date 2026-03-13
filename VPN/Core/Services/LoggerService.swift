//
//  LoggerService.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation

protocol LoggerServiceProtocol {
    func log(_ message: String)
}

final class LoggerService: LoggerServiceProtocol {
    static let shared = LoggerService()
    
    private init() {}
    
    func log(_ message: String) {
        #if DEBUG
        print("[\(Date())] \(message)")
        #endif
    }
}
