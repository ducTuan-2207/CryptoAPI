//
//  UIApplication.swift
//  CryptoAPI
//
//  Created by macOS on 16/05/2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
