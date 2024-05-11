//
//  CoinImageView.swift
//  CryptoAPI
//
//  Created by macOS on 10/05/2024.
//

import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image:UIImage? = nil
    @Published var isLoading: Bool = false
    
    init() {
        getImage()
    }
    private func getImage() {
        
    }
}

struct CoinImageView: View {
    
    @StateObject var vm:CoinImageViewModel = CoinImageViewModel()
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            }
            else {
                Image(systemName: "questionmark")
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
