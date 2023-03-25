//
//  FirstHomeworkOtusApp.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 05.03.2023.
//

import SwiftUI

@main
struct FirstHomeworkOtusApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MusicListViewModel())
        }.onChange(of: scenePhase) { newValue in
            switch scenePhase {
                
            case .background:
                debugPrint("background")
            case .inactive:
                debugPrint("inactive")
            case .active:
                debugPrint("active")
            @unknown default:
                debugPrint("default")
            }
        }
    }
}
