//
//  CryptoLiquidityModel.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 24/3/24.
//

import Foundation

struct CryptoLiquidityModel {
    var cryptocurrency: Cryptocurrency
    
    var liquidity24: Double
    
    
    func convertToDictionary() -> [String:Any]{
        return [
            "cryptocurrency":cryptocurrency.convertToDictionary(),
            "liquidity24":liquidity24
        ]
    }
}
