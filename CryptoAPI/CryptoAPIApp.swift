//
//  CryptoAPIApp.swift
//  CryptoAPI
//
//  Created by macOS on 01/05/2024.
//

import SwiftUI

@main
struct CryptoAPIApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
