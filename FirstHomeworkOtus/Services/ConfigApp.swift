//
//  ConfigApp.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 01.04.2023.
//

import Foundation

class ConfigApp {
    static let shared = ConfigApp()
    
    func registerAll() {
        ServiceLocator.shared.addService(service: Analytics())
        ServiceLocator.shared.addService(service: DataStorage())
        ServiceLocator.shared.addService(service: NetworkClient())
        ServiceLocator.shared.addService(service: Parsing())
    }
}
