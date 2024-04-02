//
//  TVCoinDetailsSingleRow.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 28/3/24.
//

import UIKit

class TVCoinDetailsSingleRow: UIView {

    //MARK: - Variables
    
    
    //MARK: - UI Components
    private let propertyNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black

        return label
    }()
    
    private let propertyValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 5
        return sv
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, value: String) {
        super.init(frame: .zero)
        
        self.propertyNameLabel.text = title
        self.propertyValueLabel.text = value
        
        setupUI()

    }
    
    func setNewValues(title: String, value: String) {
        propertyNameLabel.text = title
        propertyValueLabel.text = value
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(propertyNameLabel)
        stackView.addArrangedSubview(propertyValueLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    //MARK: - Selectors


}
