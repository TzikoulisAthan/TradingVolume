//
//  NetworkManager.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 22/3/24.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private let baseURL = "https://api.coinlore.net/api/tickers/"
    
    func execute(url: String, completion: @escaping (Result<CryptocurrencyData, Error>) -> Void) {
        AF.request(url).validate().responseJSON { response in
            
            switch response.result {
                
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data)
                    let decodedData = try JSONDecoder().decode(CryptocurrencyData.self, from: jsonData)
                    
                    completion(.success(decodedData))
                    
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
