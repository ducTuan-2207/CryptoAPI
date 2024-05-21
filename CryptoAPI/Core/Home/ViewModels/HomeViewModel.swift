//
//  HomeViewModel.swift
//  CryptoAPI
//
//  Created by macOS on 09/05/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    // Khai báo hai thuộc tính là mảng các đối tượng CoinModel với thuộc tính bọc @Published,
    // có tác dụng tự động thông báo cho các view khi giá trị thay đổi.
    @Published var allCoin: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -8)
      
    ] 
    
    private let dataService = CoinDataService()
    private var cancellable = Set<AnyCancellable>()
    
    // Khởi tạo lớp.
    init() {
        addSubcribers()
    }
    // Trong hàm addSubcribers(), cập nhật cách xử lý dữ liệu nhận được từ CoinDataService
    func addSubcribers() {
//        dataService.$allCoins
//            .sink { [weak self] (returnedCoins) in
//                self?.allCoin = returnedCoins
//            }
//            .store(in: &cancellable)
        //updates allCoins
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            
            .sink { [weak self] (returnedCoins) in
                self?.allCoin = returnedCoins
            }
            .store(in: &cancellable)
    }
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        return coins.filter { (coin) -> Bool in
            return  coin.name.lowercased().contains(lowercasedText) ||
                    coin.symbol.lowercased().contains(lowercasedText) ||
                    coin.id.lowercased().contains(lowercasedText)
        }
    }

}
