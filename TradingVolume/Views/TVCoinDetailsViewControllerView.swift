//
//  TVCoinDetailsViewControllerView.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 28/3/24.
//

import UIKit

final class TVCoinDetailsViewControllerView: UIView {
    
    //MARK: - Variables
    var coin: CryptoLiquidityModel? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: - UI Components
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fillEqually
        return sv
    }()
    
    private var id = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private var name = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private var price_usd = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private var market_cap_usd = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private var volume24 = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    
    private let symbol = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let rank = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let percent_change_24h = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let percent_change_1h = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let percent_change_7d = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let price_btc = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let volume24a = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let csupply = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let tsupply = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    private let msupply = TVCoinDetailsSingleRow(title: "Price:", value: "200")
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        //        detailsVC.delegate = self
        print(coin)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - UI Setup
    private func setupUI() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let views = [id,name,price_usd,market_cap_usd,volume24,symbol,rank,percent_change_24h,percent_change_1h,percent_change_7d,price_btc,volume24a,csupply,tsupply,msupply]
        
        for everyView in views {
            stackView.addArrangedSubview(everyView)
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
    }
    
    //MARK: - Functions
    private func updateUI() {
        guard let coin = coin else { return }
        
        id.setNewValues(title: "id:", value: coin.cryptocurrency.id)
        name.setNewValues(title: "Name:", value: coin.cryptocurrency.name)
        price_usd.setNewValues(title: "Price(USD):", value: coin.cryptocurrency.price_usd)
        market_cap_usd.setNewValues(title: "Market Cap:", value: coin.cryptocurrency.market_cap_usd)
        volume24.setNewValues(title: "Volume 24h:", value: String(format: "%.2f",coin.cryptocurrency.volume24))
        symbol.setNewValues(title: "Symbol:", value: coin.cryptocurrency.symbol)
        rank.setNewValues(title: "Rank:", value: String(coin.cryptocurrency.rank))
        percent_change_24h.setNewValues(title: "Change % 24h:", value: coin.cryptocurrency.percent_change_24h)
        percent_change_1h.setNewValues(title: "Change % 1h:", value: coin.cryptocurrency.percent_change_1h)
        percent_change_7d.setNewValues(title: "Change % 7d:", value: coin.cryptocurrency.percent_change_7d)
        price_btc.setNewValues(title: "Price (btc):", value: coin.cryptocurrency.price_btc)
        volume24a.setNewValues(title: "Volume24a:", value: String(format: "%.2f", coin.cryptocurrency.volume24a))
        csupply.setNewValues(title: "Current supply:", value: coin.cryptocurrency.csupply)
        tsupply.setNewValues(title: "Total supply:", value: coin.cryptocurrency.tsupply ?? "N/A")
        msupply.setNewValues(title: "Max supply:", value: coin.cryptocurrency.msupply ?? "N/A")
    }
}
