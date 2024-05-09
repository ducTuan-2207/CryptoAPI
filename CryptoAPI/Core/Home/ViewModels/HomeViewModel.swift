//
//  HomeViewModel.swift
//  CryptoAPI
//
//  Created by macOS on 09/05/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // Khai báo hai thuộc tính là mảng các đối tượng CoinModel với thuộc tính bọc @Published,
    // có tác dụng tự động thông báo cho các view khi giá trị thay đổi.
    @Published var allCoin: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    // Khởi tạo lớp.
    init() {
        // Lên lịch thực hiện một khối mã sau 2 giây.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Thêm một đối tượng coin vào mảng allCoin.
            self.allCoin.append(DeveloperPreview.instance.coin)
            // Thêm một đối tượng coin vào mảng portfolioCoins.
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
