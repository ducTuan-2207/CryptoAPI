//
//  ContentView.swift
//  CryptoAPI
//
//  Created by macOS on 01/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Text("Accent color")
                    .foregroundColor(Color.theme.accent)
                Text("Secondar color")
                    .foregroundColor(Color.theme.secondaryText)
                Text("Red color")
                    .foregroundColor(Color.theme.red)
                Text("Green color")
                    .foregroundColor(Color.theme.green)
                
                    .frame(maxWidth: .infinity)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
