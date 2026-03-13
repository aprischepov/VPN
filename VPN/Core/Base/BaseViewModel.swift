//
//  BaseViewModel.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import SwiftUI
import Combine

class BaseViewModel: ObservableObject {
    var cancellable = Set<AnyCancellable>()
    
    @Injected var logger: LoggerServiceProtocol
    
    init() {
        bind()
        logInitViewModel()
    }
    
    func bind() {}
    
    deinit {
        logDeinitViewModel()
    }
}

private extension BaseViewModel {
    func logInitViewModel() {
        logger.log("\(Self.self) init")
    }
    
    func logDeinitViewModel() {
        logger.log("\(Self.self) deinit")
    }
}
