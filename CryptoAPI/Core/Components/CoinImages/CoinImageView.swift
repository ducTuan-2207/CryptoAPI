//
//  CoinImageView.swift
//  CryptoAPI
//
//  Created by macOS on 10/05/2024.
//

import SwiftUI

struct CoinImageView: View {

    @StateObject var vm: CoinImageViewModel // Sử dụng @StateObject để theo dõi thay đổi trong CoinImageViewModel.

    init(coin: CoinModel) { // Hàm khởi tạo nhận một đối tượng CoinModel làm tham số đầu vào.
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin)) // Khởi tạo StateObject để quản lý ViewModel và cập nhật giao diện khi có sự thay đổi trong ViewModel.
    }

    var body: some View { // Giao diện của CoinImageView.
        ZStack { // Sử dụng ZStack để xếp các View lên nhau.
            if let image = vm.image { // Nếu hình ảnh đã được tải thành công.
                Image(uiImage: image) // Hiển thị hình ảnh.
                    .resizable() // Cho phép điều chỉnh kích thước.
                    .scaledToFit() // Thích ứng kích thước với khung.
            } else if vm.isLoading { // Nếu đang tải hình ảnh.
                ProgressView() // Hiển thị thanh tiến trình.
            } else { // Nếu không có hình ảnh và cũng không đang tải.
                Image(systemName: "questionmark") // Hiển thị biểu tượng câu hỏi.
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider { // PreviewProvider cho CoinImageView.

    static var previews: some View {
        CoinImageView(coin: dev.coin) // Xem trước CoinImageView với dữ liệu mẫu từ dev.coin.
            .padding() // Thêm padding cho giao diện xem trước.
            .previewLayout(.sizeThatFits) // Xác định cách hiển thị trong xem trước.
    }
}
