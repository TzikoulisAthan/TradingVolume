//
//  TVCoinDetailsViewController.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 26/3/24.
//

import UIKit

//protocol TVCoinDetailsViewControllerDelegate {
//    func didLoadSingleCoin()
//}

final class TVCoinDetailsViewController: UIViewController {
    
    
    //MARK: - Variables
//    var delegate: TVCoinDetailsViewControllerDelegate?
    
    //MARK: - UI Components
    var coin: CryptoLiquidityModel?
    private let detailsView = TVCoinDetailsViewControllerView()

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        detailsView.coin = coin
    }
    

    
    //MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(detailsView)
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            detailsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - Selectors


    
}
