//
//  ViewController.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 21/3/24.
//

import UIKit

class TVMainViewController: UIViewController, TVMainViewControllerViewButtonDelegate, TVMainViewControllerViewModelTableViewDelegate {


    //MARK: - Variables
    
    //MARK: - UI Components
    private let viewModel = TVMainViewControllerViewModel()
    private lazy var mainView = TVMainViewControllerView(vm: self.viewModel)
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationController?.isNavigationBarHidden = true
        mainView.delegate = self
        viewModel.tableViewDelegate = self
        setupUI()
        
        
    }
    
    func didTapSelectRangeButton() {
        let destinationVC = TVSelectRangeViewController()
        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        
        destinationVC.viewModel = viewModel
        
        present(destinationVC, animated: true)
    }
    
    func didSelectCoin(coin: CryptoLiquidityModel) {
        let vc = TVCoinDetailsViewController()
        vc.title = "title"
        vc.coin = coin
        navigationController?.present(vc, animated: true)
    }
   
    
    //MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - Selectors


}

