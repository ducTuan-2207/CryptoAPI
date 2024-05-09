//
//  Double.swift
//  CryptoAPI
//
//  Created by macOS on 08/05/2024.
//

import Foundation

extension Double {
    // converts a double into a currency with 2-6 decimal places
    // 1234.56 -> $1,234.56
    private var currencyFormatter6: NumberFormatter {
        // Khởi tạo một đối tượng NumberFormatter.
        let formatter = NumberFormatter()
        // Thiết lập việc sử dụng phân cách nhóm.
        formatter.usesGroupingSeparator = true
        // Đặt kiểu số là kiểu tiền tệ.
        formatter.numberStyle = .currency
        // Đặt vùng địa lý cho định dạng số là vùng địa lý hiện tại của thiết bị.
       // formatter.locale = .current
        // Đặt mã tiền tệ là "usd".
       // formatter.currencyCode = "usd"
        // Đặt ký hiệu tiền tệ là "$".
//formatter.currencySymbol = "$"
        // Trả về đối tượng formatter đã được cấu hình.
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
