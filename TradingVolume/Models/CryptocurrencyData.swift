//
//  CryptocurrencyModel.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 22/3/24.
//

import Foundation


struct CryptocurrencyData: Codable {
    let data: [Cryptocurrency]
    let info: Info
}

struct Cryptocurrency: Codable {
    var id: String
    var name: String
    var price_usd: String
    var market_cap_usd: String
    var volume24: Double
    
    let symbol: String
    let rank: Int
    let percent_change_24h: String
    let percent_change_1h: String
    let percent_change_7d: String
    let price_btc: String
    let volume24a: Double
    let csupply: String
    let tsupply: String?
    let msupply: String?
    
    func convertToDictionary() -> [String:Any] {
        return [
            "id":id,
            "name":name,
            "price_usd":price_usd,
            "market_cap_usd":market_cap_usd,
            "volume24":volume24,
            "symbol":symbol,
            "rank":rank,
            "percent_change_24h":percent_change_24h,
            "percent_change_1h":percent_change_1h,
            "percent_change_7d":percent_change_7d,
            "price_btc":price_btc,
            "volume24a":volume24a,
            "csupply":csupply,
            "tsupply":tsupply ?? "N/A",
            "msupply":msupply ?? "N/A"
        ]
    }
}

struct Info: Codable {
    let coins_num: Int
    let time: Int
}
