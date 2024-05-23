//
//  MarketDataService.swift
//  CryptoAPI
//
//  Created by macOS on 23/05/2024.
//

import Foundation
import Combine

class MarketDataService {
    @Published var markerData: MarketDataModel? = nil
    var cancellabble = Set<AnyCancellable>() // Một tập hợp để lưu trữ các subscriber và tránh retain cycle
    var marketDataSubcription: AnyCancellable?
    init() {
        getCoin()
    }
    private func getCoin() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {return}
        
        // Đăng ký closure để xử lý hoàn thành và nhận giá trị từ publisher
        marketDataSubcription =  NetwokingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetwokingManager.handleCompletion, receiveValue: { (returnedGlobalData) in
                // Xử lý giá trị nhận được từ publisher
                // Gán giá trị nhận được cho thuộc tính allCoins của đối tượng self
                self.markerData = returnedGlobalData.data
                self.marketDataSubcription?.cancel()
            })
           
            //.store(in: &cancellabble)     // Lưu trữ subscriber trong tập hợp cancellable để tránh retain cycle

    }
    
}

