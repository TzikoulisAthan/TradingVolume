//
//  TVSelectRangeViewControllerView.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 26/3/24.
//

import UIKit

protocol TVSelectRangeViewControllerViewDelegate {
    func rangeSelected(range: Int)
}

class TVSelectRangeViewControllerView: UIView {

    
    //MARK: - Variables
    var delegate: TVSelectRangeViewControllerViewDelegate?
    
    //MARK: - UI Components
    let zeroToTenPercentageButton = UIButton()
    let tenToTwentyPercentageButton = UIButton()
    let twentyToThirtyPercentageButton = UIButton()
    let aboveThirtyPercentageButton = UIButton()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    func layoutUI() {
        let buttons: [UIButton] = [zeroToTenPercentageButton, tenToTwentyPercentageButton, twentyToThirtyPercentageButton, aboveThirtyPercentageButton]
        
        for button in buttons {
            addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.configuration = .tinted()
        }
        
        zeroToTenPercentageButton.configuration?.title = "0...10 %"
        zeroToTenPercentageButton.configuration?.baseForegroundColor = .systemRed
        zeroToTenPercentageButton.configuration?.baseBackgroundColor = .systemRed
        zeroToTenPercentageButton.addTarget(self, action: #selector(zeroToTenPercentageTapped), for: .touchUpInside)
        
        tenToTwentyPercentageButton.configuration?.title = "10...20 %"
        tenToTwentyPercentageButton.configuration?.baseForegroundColor = .systemOrange
        tenToTwentyPercentageButton.configuration?.baseBackgroundColor = .systemOrange
        tenToTwentyPercentageButton.addTarget(self, action: #selector(tenToTwentyPercentageTapped), for: .touchUpInside)
        
        twentyToThirtyPercentageButton.configuration?.title = "20...30 %"
        twentyToThirtyPercentageButton.configuration?.baseForegroundColor = .systemYellow
        twentyToThirtyPercentageButton.configuration?.baseBackgroundColor = .systemYellow
        twentyToThirtyPercentageButton.addTarget(self, action: #selector(twentyToThirtyPercentageTapped), for: .touchUpInside)
        
        aboveThirtyPercentageButton.configuration?.title = "30+ %"
        aboveThirtyPercentageButton.configuration?.baseForegroundColor = .systemGreen
        aboveThirtyPercentageButton.configuration?.baseBackgroundColor = .systemGreen
        aboveThirtyPercentageButton.addTarget(self, action: #selector(aboveThirtyPercentageTapped), for: .touchUpInside)
        
        let padding: CGFloat = 15
        let buttonHeight: CGFloat = 80
        let buttonWidth: CGFloat = 220
        
        
        NSLayoutConstraint.activate([
            zeroToTenPercentageButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            zeroToTenPercentageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            zeroToTenPercentageButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            zeroToTenPercentageButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            tenToTwentyPercentageButton.topAnchor.constraint(equalTo: zeroToTenPercentageButton.bottomAnchor, constant: padding),
            tenToTwentyPercentageButton.centerXAnchor.constraint(equalTo: zeroToTenPercentageButton.centerXAnchor),
            tenToTwentyPercentageButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            tenToTwentyPercentageButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            twentyToThirtyPercentageButton.topAnchor.constraint(equalTo: tenToTwentyPercentageButton.bottomAnchor, constant: padding),
            twentyToThirtyPercentageButton.centerXAnchor.constraint(equalTo: tenToTwentyPercentageButton.centerXAnchor),
            twentyToThirtyPercentageButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            twentyToThirtyPercentageButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            aboveThirtyPercentageButton.topAnchor.constraint(equalTo: twentyToThirtyPercentageButton.bottomAnchor, constant: padding),
            aboveThirtyPercentageButton.centerXAnchor.constraint(equalTo: twentyToThirtyPercentageButton.centerXAnchor),
            aboveThirtyPercentageButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            aboveThirtyPercentageButton.widthAnchor.constraint(equalToConstant: buttonWidth)
        ])
        
    }
    
    //MARK: - Selectors

    @objc func zeroToTenPercentageTapped() {
        delegate?.rangeSelected(range: 0)
    }
    
    
    @objc func tenToTwentyPercentageTapped() {
        delegate?.rangeSelected(range: 1)
    }
    
    
    @objc func twentyToThirtyPercentageTapped() {
        delegate?.rangeSelected(range: 2)
    }
    
    
    @objc func aboveThirtyPercentageTapped() {
        delegate?.rangeSelected(range: 3)
    }
    
}
