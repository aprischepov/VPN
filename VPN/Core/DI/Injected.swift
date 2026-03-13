//
//  Injected.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation

@propertyWrapper
struct Injected<T> {
    private let container: DIContainer
    
    var wrappedValue: T { container.resolve() }
    
    init(
        container: DIContainer = .shared
    ) {
        self.container = container
    }
}
