//
//  InjectedPropertyWrapper.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 30.03.2023.
//

import Foundation

@propertyWrapper

struct Injected<Service> {
    
    weak var locator = ServiceLocator.shared
    var service: Service? = nil
    
    var wrappedValue: Service? {
        mutating set {
            service = newValue
        }
        mutating get {
            if service == nil {
                service =  locator?.getService()
            }
            return service
        }
    }
    
    var projectedValue: Injected<Service> {
        mutating set {
            self = newValue
        }
        get {
            return self
        }
    }
}
