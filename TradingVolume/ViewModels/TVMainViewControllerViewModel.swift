//
//  MainViewControllerViewModel.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 22/3/24.
//

import UIKit

/// Communicate with the View to notify it that the data are loaded
protocol TVMainViewControllerViewModelDelegate {
    func didLoadCoins()
}

protocol TVMainViewControllerViewModelTableViewDelegate {
    func didSelectCoin(coin: CryptoLiquidityModel)
}

class TVMainViewControllerViewModel: NSObject {
    
    //MARK: - Variables
    private let networkManager = NetworkManager()
    //    private let baseURL = "https://api.coinlore.net/api/tickers/?start=0&limit=10"
    
    private var coinList = [Cryptocurrency]()
    private var liquidityAbove30List: [CryptoLiquidityModel] = [CryptoLiquidityModel]()
    private var liquidityAbove20List: [CryptoLiquidityModel] = [CryptoLiquidityModel]()
    private var liquidityAbove10List: [CryptoLiquidityModel] = [CryptoLiquidityModel]()
    private var liquidityBelow10List: [CryptoLiquidityModel] = [CryptoLiquidityModel]()
    private var coinLiquidityList: [CryptoLiquidityModel] = [CryptoLiquidityModel]()
    var delegate: TVMainViewControllerViewModelDelegate?
    var tableViewDelegate: TVMainViewControllerViewModelTableViewDelegate?
    
    var selectedList: Int = 3  {
        didSet {
            delegate?.didLoadCoins()
        }
    }
    
    
    //MARK: - Functions
    
    /// Run networking task and fetch data. It makes 5 network call each of which fetches 100 coins
    func decodeData(completion: @escaping () -> Void) async {
        coinList = []
        var page = 0
        
        while page < 1000 {
            let baseURL = "https://api.coinlore.net/api/tickers/?start=\(page)&limit=100"
            
            networkManager.execute(url: baseURL) { result in
                switch result {
                case.success(let decodedData):
                    for coin in decodedData.data {
                        self.coinList.append(coin)
                        self.calculateDailyTurnoverRatio(coin: coin)
                        
                        self.delegate?.didLoadCoins()
                    }
                case .failure(let error):
                    print(error)
                }
            }
            page += 100
            
        } //endwhile
        
        completion()
    }
    
    
    /// Calculate liquidity by dividing daily volume/market cap
    /// Creates 4 lists. Each list contains the coins that have the given turnover ration
    func calculateDailyTurnoverRatio(coin: Cryptocurrency) {
        
        let coinLiquidity24 = (coin.volume24 / Double(coin.market_cap_usd)!)*100
        let newCoin = CryptoLiquidityModel(cryptocurrency: coin, liquidity24: coinLiquidity24)
        coinLiquidityList.append(newCoin)
        
        switch coinLiquidity24 {
        case 30...1000:
            liquidityAbove30List.append(newCoin)
        case 20...29:
            liquidityAbove20List.append(newCoin)
        case 10...19:
            liquidityAbove10List.append(newCoin)
        default:
            liquidityBelow10List.append(newCoin)
        }
        
    }
    
    func returnCoinList() -> [CryptoLiquidityModel] {
        return coinLiquidityList
    }
    
    
}


extension TVMainViewControllerViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedList {
        case 0:
            return liquidityBelow10List.count
        case 1:
            return liquidityAbove10List.count
        case 2:
            return liquidityAbove20List.count
        case 3:
            return liquidityAbove30List.count
        default:
            return liquidityBelow10List.count        }    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mainTableViewCell, for: indexPath) as! VTMainTableViewCell
        
        switch selectedList {
        case 0:
            liquidityBelow10List.sort { 
                $0.liquidity24 > $1.liquidity24
            }
            let coin = liquidityBelow10List[indexPath.row]
            cell.set(coinSymbol: coin.cryptocurrency.name,
                     coinPrice: coin.cryptocurrency.price_usd,
                     change24: coin.cryptocurrency.percent_change_24h,
                     liquidity24: String(format: "%.2f", coin.liquidity24))
        case 1:
            liquidityAbove10List.sort {
                $0.liquidity24 > $1.liquidity24
            }
            let coin = liquidityAbove10List[indexPath.row]
            cell.set(coinSymbol: coin.cryptocurrency.name,
                     coinPrice: coin.cryptocurrency.price_usd,
                     change24: coin.cryptocurrency.percent_change_24h,
                     liquidity24: String(format: "%.2f", coin.liquidity24))
            
        case 2:
            liquidityAbove20List.sort {
                $0.liquidity24 > $1.liquidity24
            }
            let coin = liquidityAbove20List[indexPath.row]
            cell.set(coinSymbol: coin.cryptocurrency.name,
                     coinPrice: coin.cryptocurrency.price_usd,
                     change24: coin.cryptocurrency.percent_change_24h,
                     liquidity24: String(format: "%.2f", coin.liquidity24))
            
        case 3:
            liquidityAbove30List.sort {
                $0.liquidity24 > $1.liquidity24
            }
            let coin = liquidityAbove30List[indexPath.row]
            cell.set(coinSymbol: coin.cryptocurrency.name,
                     coinPrice: coin.cryptocurrency.price_usd,
                     change24: coin.cryptocurrency.percent_change_24h,
                     liquidity24: String(format: "%.2f", coin.liquidity24))
            
        default:
            let coin = liquidityBelow10List[indexPath.row]
            cell.set(coinSymbol: coin.cryptocurrency.name,
                     coinPrice: coin.cryptocurrency.price_usd,
                     change24: coin.cryptocurrency.percent_change_24h,
                     liquidity24: String(format: "%.2f", coin.liquidity24))
            
            
        }
        
        cell.selectionStyle = .none
        return cell
        
    }
    
}

extension TVMainViewControllerViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch selectedList {
        case 0:
            liquidityBelow10List.sort {
                $0.liquidity24 > $1.liquidity24
            }
            
            let coin = liquidityBelow10List[indexPath.row]
            tableViewDelegate?.didSelectCoin(coin: coin)

        case 1:
            liquidityAbove10List.sort {
                $0.liquidity24 > $1.liquidity24
            }
            let coin = liquidityAbove10List[indexPath.row]
            tableViewDelegate?.didSelectCoin(coin: coin)

            
        case 2:
            liquidityAbove20List.sort {
                $0.liquidity24 > $1.liquidity24
            }
            let coin = liquidityAbove20List[indexPath.row]
           
            tableViewDelegate?.didSelectCoin(coin: coin)
            

        case 3:
            liquidityAbove30List.sort {
                $0.liquidity24 > $1.liquidity24
            }
            let coin = liquidityAbove30List[indexPath.row]
            tableViewDelegate?.didSelectCoin(coin: coin)

            
        default:
            let coin = liquidityBelow10List[indexPath.row]
            
            tableViewDelegate?.didSelectCoin(coin: coin)

        }
        
    }
    
    
}

