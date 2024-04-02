//
//  VTStackView.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 26/3/24.
//

import UIKit

class VTStackView: UIStackView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Turnover Ratio"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(titleLabel: String, valueLabel: String) {
        super.init(frame: .zero)
        
        self.titleLabel.text = titleLabel
        self.valueLabel.text = valueLabel
        
        setupUI()
    }
    
    
    private func setupUI() {
        axis = .vertical
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
}
