//
//  ServiceLocator.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 30.03.2023.
//

import Foundation


final class ServiceLocator {
    
    static let shared = ServiceLocator()
    var data = [String: Any] ()
    
    func addService<T:Any>(service: T){
        let key = String.init(describing: T.self)
        data[key] = service
    }
    
    func getService<T>()->T? {
        let key = String.init(describing: T.self)
        return data[key] as? T
    }
}
