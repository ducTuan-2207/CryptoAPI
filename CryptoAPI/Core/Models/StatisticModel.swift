//
//  StaticModel.swift
//  CryptoAPI
//
//  Created by macOS on 21/05/2024.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
}
