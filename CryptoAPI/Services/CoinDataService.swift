//
//  CoinDataService.swift
//  CryptoAPI
//
//  Created by macOS on 10/05/2024.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins:[CoinModel] = []
    var cancellabble = Set<AnyCancellable>() // Một tập hợp để lưu trữ các subscriber và tránh retain cycle
    var coinSubcription: AnyCancellable?
    init() {
        getCoin()
    }
    private func getCoin() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {return}
        
        // Đăng ký closure để xử lý hoàn thành và nhận giá trị từ publisher
        coinSubcription =  NetwokingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetwokingManager.handleCompletion, receiveValue: { (returnedCoins) in
                // Xử lý giá trị nhận được từ publisher
                // Gán giá trị nhận được cho thuộc tính allCoins của đối tượng self
                self.allCoins = returnedCoins
                self.coinSubcription?.cancel()
            })
           
            //.store(in: &cancellabble)     // Lưu trữ subscriber trong tập hợp cancellable để tránh retain cycle

    }
    
}
