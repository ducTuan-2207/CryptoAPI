//
//  CoinModel.swift
//  CryptoAPI
//
//  Created by macOS on 08/05/2024.
//

import Foundation
// coinGecKo API info
/**
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 63123,
     "market_cap": 1242262778786,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1324559556243,
     "total_volume": 24605401377,
     "high_24h": 64413,
     "low_24h": 62848,
     "price_change_24h": 103.01,
     "price_change_percentage_24h": 0.16345,
     "market_cap_change_24h": 2750332789,
     "market_cap_change_percentage_24h": 0.22189,
     "circulating_supply": 19695240,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 73738,
     "ath_change_percentage": -14.47743,
     "ath_date": "2024-03-14T07:10:36.635Z",
     "atl": 67.81,
     "atl_change_percentage": 92900.30432,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2024-05-07T19:22:37.219Z",
     "sparkline_in_7d": {
       "price": [60338.8112115356, 60235.0767234763, 59130.9028893669, 59862.8140101331, 60135.1650856609, 60460.4611382798, 60570.4995672737, 60199.0954148025, 60008.80141448, 59867.7412200809, 60250.1995195175, 60222.0635421947, 59941.0340574517, 59505.8054798765, 57257.0264134007, 56903.0142196997, 57079.4526691976, 57683.0457997038, 57812.7461260713, 57877.0538820103, 57340.6049300783, 57425.102178797, 56803.9616662367, 57020.2801889052, 57468.6989454788, 59051.9920922349, 56852.0572812893, 57361.4276584326, 57831.6472919851, 57820.4460629317, 58305.9443188054, 57737.2260440526, 57079.4228529239, 57405.6673346048, 57473.1918432855, 57307.5243226731, 57395.8464369162, 57590.4664357726, 57635.9344385378, 57826.7318073255, 57807.0543714832, 57807.7136532518, 58515.1994487918, 58736.5225940119, 58422.0928633214, 59052.4494387405, 59295.0623192332, 59007.4165016781, 59235.7601033279, 59478.1716907457, 59264.3721902916, 58825.0939576724, 59103.2816954978, 59309.2500581026, 59101.803598158, 59035.0253990535, 59312.1912778891, 59547.6767052633, 59734.7148867499, 59576.7573622084, 59517.6539914523, 59263.634858451, 59163.1799465065, 59274.3629312509, 59512.8142037543, 59033.3912274909, 59270.4797248366, 60679.8087496387, 61545.3751625031, 61635.0997671918, 61812.44744056, 61692.1273698405, 61873.3195831999, 61824.9899724315, 61941.3275580329, 62900.5128047387, 62592.3807491242, 62846.0591760565, 62888.5088913045, 63123.4915048406, 62781.5222836998, 62706.7484187042, 62740.0516010624, 63122.6922241352, 63417.2194653846, 62982.5502274118, 62989.0394753141, 63174.8181141531, 63166.6092467881, 64339.8325053007, 63857.8396083841, 64022.3197111508, 63629.5192675663, 63883.2215931917, 63580.8679329713, 63670.7550557312, 63473.0109163789, 63639.7349956312, 63951.2254638687, 63876.5060312304, 63965.3823420026, 63645.4838209106, 63916.7594807191, 63523.5436463189, 63250.6706790411, 63145.1057090185, 63252.5026693268, 63362.6835371423, 63207.7402424975, 63397.700563612, 63765.0924376795, 63683.490844069, 63752.8137866948, 63731.1704466881, 63861.7157721262, 63735.6344016566, 64108.6497365335, 64156.0514401762, 64396.4439166226, 64279.8451504073, 64196.8576854336, 63925.745831577, 63838.3578202111, 63757.9483644491, 63800.4164271342, 63880.7152931481, 64090.0964256939, 64239.5207252965, 64142.8459746707, 63856.6788249356, 63835.416590741, 64128.6802814791, 64128.1831461371, 64317.4638424195, 64531.2018888309, 65154.7003956532, 65138.1608688222, 64073.7013683993, 64248.9325807796, 63412.0987017822, 63910.4618474974, 63276.7791293284, 63679.7789523358, 63246.9503777439, 63241.7606571449, 63412.3810764533, 63138.4251455909, 63321.0276546403, 63503.0843509618, 63494.7795387161, 63159.4137703426, 63512.3017853216, 63881.4539115781, 63697.2808514363, 63249.4234864935, 63451.3771784011, 63496.7681790353, 63632.8984832694, 63663.8188762857, 64212.1970929267, 64119.7199838509, 64116.1292744879, 63468.9968698288, 63703.3694756043, 63188.032370602, 63924.4276117444, 63750.2153575109, 63589.7269189421]
     },
     "price_change_percentage_24h_in_currency": 0.163450718475337
   },

 **/
struct CoinModel: Identifiable,Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank: Double
    let fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H, priceChange24H: Double
    let priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double
    let totalSupply, maxSupply: Double?
    let ath, athChangePercentage: Double
    let athDate: String
    let atl, atlChangePercentage: Double
    let atlDate: String
    let lastUpdated: String
    let sparklineIn7D: SparklineIn7D
    let priceChangePercentage24HInCurrency: Double
    
    
    let currentHoldings: Double?
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    // cập nhật các khoản nắm giữ hiện tại
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}


struct SparklineIn7D: Codable {
    let price: [Double]
}
