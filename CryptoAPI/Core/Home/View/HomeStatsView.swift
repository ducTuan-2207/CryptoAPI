//
//  HomeStatsView.swift
//  CryptoAPI
//
//  Created by macOS on 21/05/2024.
//

import SwiftUI

struct HomeStatsView: View {
    
//    let statistics: [StatisticModel] = [
//        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
//        StatisticModel(title: "Title", value: "Value"),
//        StatisticModel(title: "Title", value: "Value"),
//        StatisticModel(title: "Title", value: "Value", percentageChange: -8)
//
//    ]
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width/3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}