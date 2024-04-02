//
//  TVSelectRangeViewController.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 26/3/24.
//

import UIKit

class TVSelectRangeViewController: UIViewController, TVSelectRangeViewControllerViewDelegate {
    
    private let selectRangeView = TVSelectRangeViewControllerView()
    var viewModel: TVMainViewControllerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectRangeView.delegate = self
        setupUI()
    }
    
    
    func rangeSelected(range: Int) {
        viewModel?.selectedList = range
        
        dismiss(animated: true) 
    }
    
    private func setupUI() {
        view.addSubview(selectRangeView)
        selectRangeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectRangeView.topAnchor.constraint(equalTo: view.topAnchor),
            selectRangeView.leftAnchor.constraint(equalTo: view.leftAnchor),
            selectRangeView.rightAnchor.constraint(equalTo: view.rightAnchor),
            selectRangeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
