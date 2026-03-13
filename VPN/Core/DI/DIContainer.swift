//
//  DIContainer.swift
//  VPN
//
//  Created by Artem Prischepov on 13.03.26.
//

import Foundation

final class DIContainer {
    static let shared = DIContainer()
    
    typealias LazyInitClosure = () -> Any
    
    private var dependencies: [String: Any] = [:]
    private var lazyDependencies: [String: LazyInitClosure] = [:]
    
    func register<DT: Any>(_ closure: @escaping () -> DT) {
        lazyDependencies["\(DT.self)"] = closure
    }
    
    func lazyRegister<T>(_ closure: @escaping () -> T) {
        lazyDependencies["\(T.self)"] = closure
    }
    
    func remove<DT: Any>(_ object: DT.Type) {
        dependencies.removeValue(forKey: "\(object.self)")
    }
    
    func resolve<DT: Any>() -> DT {
        if dependencies["\(DT.self)"] == nil {
            let dependency = lazyDependencies["\(DT.self)"]?()
            dependencies["\(DT.self)"] = dependency
        }
        return dependencies["\(DT.self)"] as! DT
    }
}
