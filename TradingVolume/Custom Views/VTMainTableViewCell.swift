//
//  VTMainTableViewCell.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 23/3/24.
//

import UIKit

class VTMainTableViewCell: UITableViewCell {
    
    //MARK: - Variables
    
    
    //MARK: - UI Components
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor.systemTeal
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let volume24Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let change24Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let change24TextLabel: UILabel = {
        let label = UILabel()
        label.text = "Change 24h:"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let volume24TextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Turnover Ratio"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let priceTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Price:"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    func set(coinSymbol: String, coinPrice: String, change24: String, liquidity24: String) {
        symbolLabel.text = "\(coinSymbol)/USD"
        priceLabel.text = coinPrice
        change24Label.text = change24
        volume24Label.text = liquidity24
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        
        let views = [symbolLabel, priceLabel, volume24Label, change24Label, priceTextLabel, volume24TextLabel, change24TextLabel]
        
        for everyView in views {
            addSubview(everyView)
            everyView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let padding: CGFloat = 15
        
        
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding*2),
            symbolLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            symbolLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceTextLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: padding*2),
            priceTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding*2),
            priceTextLabel.heightAnchor.constraint(equalToConstant: 20),
            priceTextLabel.widthAnchor.constraint(equalToConstant: screenWidth/2),
            
            priceLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: padding*2),
            priceLabel.leadingAnchor.constraint(equalTo: priceTextLabel.trailingAnchor, constant: padding),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding*2),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            volume24TextLabel.topAnchor.constraint(equalTo: priceTextLabel.bottomAnchor, constant: padding),
            volume24TextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding*2),
            volume24TextLabel.heightAnchor.constraint(equalToConstant: 20),
            volume24TextLabel.widthAnchor.constraint(equalToConstant: screenWidth/2),
            
            volume24Label.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: padding),
            volume24Label.leadingAnchor.constraint(equalTo: priceTextLabel.trailingAnchor, constant: padding),
            volume24Label.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding*2),
            volume24Label.heightAnchor.constraint(equalToConstant: 20),
            
            change24TextLabel.topAnchor.constraint(equalTo: volume24TextLabel.bottomAnchor, constant: padding),
            change24TextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding*2),
            change24TextLabel.heightAnchor.constraint(equalToConstant: 20),
            change24TextLabel.widthAnchor.constraint(equalToConstant: screenWidth/2),
            
            change24Label.topAnchor.constraint(equalTo: volume24Label.bottomAnchor, constant: padding),
            change24Label.leadingAnchor.constraint(equalTo: priceTextLabel.trailingAnchor, constant: padding),
            change24Label.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding*2),
            change24Label.heightAnchor.constraint(equalToConstant: 20),
        ])
      
        
    }



}
