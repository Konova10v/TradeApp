//
//  TestSlavitApp.swift
//  TestSlavit
//
//  Created by Кирилл Коновалов on 18.10.2023.
//

import SwiftUI

@main
struct TestSlavitApp: App {
    
    @StateObject var launchScreenState = LaunchScreenStateManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                TabBar()
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
