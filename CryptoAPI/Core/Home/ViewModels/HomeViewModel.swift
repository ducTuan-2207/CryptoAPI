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
    
    private let dataService = CoinDataService()
    private var cancellable = Set<AnyCancellable>()
    
    // Khởi tạo lớp.
    init() {
        addSubcribers()
    }
    func addSubcribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in // thêm weak self để tránh tạo ra retain cycle.
                self?.allCoin = returnedCoins
            }
            .store(in: &cancellable)
    }
}
