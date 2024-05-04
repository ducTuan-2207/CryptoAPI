//
//  HomeView.swift
//  CryptoAPI
//
//  Created by macOS on 04/05/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack {
                Text("Header")
                Spacer(minLength: 0)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}
