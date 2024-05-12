//
//  CoinImageVIewModel.swift
//  CryptoAPI
//
//  Created by macOS on 12/05/2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject { // Lớp CoinImageViewModel kế thừa từ ObservableObject để theo dõi các thay đổi trong dữ liệu và cập nhật giao diện người dùng tương ứng.

    @Published var image:UIImage? = nil // Biến image được đánh dấu là @Published để thông báo cho các đối tượng khác khi giá trị của nó thay đổi, gây ra cập nhật trên giao diện người dùng.
    @Published var isLoading: Bool = false // Biến isLoading được sử dụng để hiển thị trạng thái của quá trình tải hình ảnh.

    private let coin: CoinModel // Biến lưu trữ thông tin về loại tiền ảo.
    private let dataService:  CoinImageService // DataService là một đối tượng dùng để tải hình ảnh của đồng tiền ảo.
    private var cancellable = Set<AnyCancellable>() // Biến cancellable dùng để lưu trữ các đối tượng hủy đăng ký các publishers.

    init(coin: CoinModel) { 
        self.coin = coin // Gán giá trị cho biến coin.
        self.dataService = CoinImageService(coin: coin) // Khởi tạo đối tượng DataService để tải hình ảnh dựa trên đối tượng CoinModel.
        self.addSubcriers() // Gọi hàm addSubcriers() để thêm các subscribers cho DataService.
        self.isLoading = true // Đặt isLoading thành true khi khởi tạo để bắt đầu quá trình tải hình ảnh.
    }

    private func addSubcriers() { // Phương thức này thêm các subscribers để theo dõi việc tải hình ảnh từ DataService.
        dataService.$image // Theo dõi publisher $image của DataService để nhận giá trị hình ảnh mới.
            .sink { [weak self] (_) in // Đăng ký một closure để xử lý việc nhận giá trị từ publisher.
                self?.isLoading = false // Đặt isLoading thành false khi nhận được giá trị hình ảnh hoặc gặp lỗi.
            } receiveValue: { [weak self] (returnedImage) in // Đăng ký một closure để xử lý giá trị nhận được từ publisher.
                self?.image = returnedImage // Gán giá trị hình ảnh nhận được từ publisher vào biến image.
            }
            .store(in: &cancellable) // Lưu trữ đối tượng hủy đăng ký để hủy đăng ký khi cần thiết, tránh việc xảy ra memory leak.
    }
}
