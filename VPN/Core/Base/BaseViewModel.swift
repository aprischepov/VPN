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
    
    init() {
        bind()
        logInitViewModel()
    }
    
    deinit {
        logDeinitViewModel()
    }
}

extension BaseViewModel {
    func bind() {}
}

private extension BaseViewModel {
    func logInitViewModel() {
        LoggerService.shared.log("\(Self.self) init")
    }
    
    func logDeinitViewModel() {
        LoggerService.shared.log("\(Self.self) deinit")
    }
}
