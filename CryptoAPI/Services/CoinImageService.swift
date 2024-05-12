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
    private var imageSuncription: AnyCancellable?
    private let coin: CoinModel
    
    init(coin: CoinModel){
        self.coin = coin
        getCoinImage()
        
    }
    private func getCoinImage(){
        guard let url = URL(string: coin.image) else {return}
        
        // Đăng ký closure để xử lý hoàn thành và nhận giá trị từ publisher
        imageSuncription =  NetwokingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            //.decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetwokingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                // Xử lý giá trị nhận được từ publisher
                // Gán giá trị nhận được cho thuộc tính allCoins của đối tượng self
                self?.image = returnedImage
                self?.imageSuncription?.cancel()
            })
    }
    
}

