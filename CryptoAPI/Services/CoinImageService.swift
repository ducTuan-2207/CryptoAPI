//
//  CoinImageService.swift
//  CryptoAPI
//
//  Created by macOS on 11/05/2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    var imageSuncription: AnyCancellable
    
    init(){
        //getCoinImage()
        
    }
    private func getCoinImage(urlString: String){
        guard let url = URL(string: urlString) else {return}
        
        // Đăng ký closure để xử lý hoàn thành và nhận giá trị từ publisher
        imageSuncription =  NetwokingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetwokingManager.handleCompletion, receiveValue: { (returnedCoins) in
                // Xử lý giá trị nhận được từ publisher
                // Gán giá trị nhận được cho thuộc tính allCoins của đối tượng self
                self.allCoins = returnedCoins
                self.coinSubcription?.cancel()
            })
    }
    
}

