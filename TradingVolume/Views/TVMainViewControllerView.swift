//
//  TVMainViewControllerView.swift
//  TradingVolume
//
//  Created by Athanasios Tzikoulis on 22/3/24.
//

import UIKit

protocol TVMainViewControllerViewButtonDelegate {
    func didTapSelectRangeButton()    
}


final class TVMainViewControllerView: UIView, TVMainViewControllerViewModelDelegate {
    
    //MARK: - Variables
    private var viewModel = TVMainViewControllerViewModel()
    var delegate: TVMainViewControllerViewButtonDelegate?
    
    //MARK: - UI Components
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .systemBackground
        tableview.separatorStyle = .singleLine
        tableview.rowHeight = 210
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    private let selectRangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select turnover ratio range", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowOpacity = 15
        button.addTarget(self, action: #selector(selectRange), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        viewModel.delegate = self
        setupTableView()
        setupUI()
        Task {
            await viewModel.decodeData {
                self.viewModel.delegate?.didLoadCoins()
            }
        }
    }
    
    
    /// View is initialized with the viewModel. This ensures changes of viewmodel are also available to the view
    /// - Parameter vm: the viewmodel passed in the view
    init(vm: TVMainViewControllerViewModel) {
         super.init(frame: .zero)
         self.viewModel = vm //Allocate view model from initializer.
         self.viewModel.delegate = self
         setupTableView()
         setupUI()
         Task {
               await viewModel.decodeData {
                   self.viewModel.delegate?.didLoadCoins()
               }
         }
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Functions
    private func setupTableView() {
        tableView.register(VTMainTableViewCell.self, forCellReuseIdentifier: Constants.mainTableViewCell)
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    
    func didLoadCoins() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func selectRange() {
        delegate?.didTapSelectRangeButton()
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(tableView)
        addSubview(selectRangeButton)
        
        NSLayoutConstraint.activate([
            selectRangeButton.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            selectRangeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            selectRangeButton.heightAnchor.constraint(equalToConstant: 70),
            selectRangeButton.widthAnchor.constraint(equalToConstant: 250),
            
            tableView.topAnchor.constraint(equalTo: selectRangeButton.bottomAnchor, constant: 50),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //MARK: - Selectors

}
