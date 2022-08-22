//
//  ViewController.swift
//  viewcode
//
//  Created by Swelen Poliana Cesario Ebert on 01/08/22.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    var vController = AddTransactionViewController()
    let transactions: [Transaction] = [Transaction(transactionIcon: UIImage(named: "cellIcon-1")!, transactionType: "Mercado", storeName: "Mini Extra", transactionValue: 40.00, transactionDate: "Ago 01"), Transaction(transactionIcon: UIImage(named: "cellIcon-1")!, transactionType: "Gasolina", storeName: "Shell", transactionValue: 40.00, transactionDate: "Ago 01"), Transaction(transactionIcon: UIImage(named: "cellIcon-1")!, transactionType: "IFood", storeName: "The Fifties", transactionValue: 40.00, transactionDate: "Ago 01"), Transaction(transactionIcon: UIImage(named: "cellIcon-1")!, transactionType: "IFood", storeName: "The Fifties", transactionValue: 40.00, transactionDate: "Ago 01"), Transaction(transactionIcon: UIImage(named: "cellIcon-1")!, transactionType: "IFood", storeName: "The Fifties", transactionValue: 40.00, transactionDate: "Ago 01"), Transaction(transactionIcon: UIImage(named: "cellIcon-1")!, transactionType: "IFood", storeName: "The Fifties", transactionValue: 40.00, transactionDate: "Ago 01"), Transaction(transactionIcon: UIImage(named: "cellIcon-1")!, transactionType: "IFood", storeName: "The Fifties", transactionValue: 40.00, transactionDate: "Ago 01")]
    
    lazy var mainView: UIView = {
        let rect = CGRect(x: 0.0, y: 0.0, width: 410, height: 700)
        let customView = UIView(frame: rect)
        customView.layer.cornerRadius = 22
        customView.backgroundColor = UIColor(Color("backgroundMainView"))
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        return customView
        
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.identifier)
        
        return tableView
    }()

    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.font = font
        label.text = "R$10,000.00"
        label.textColor = UIColor(Color("lightLabelColor"))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var availableBalanceLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.font = font
        label.text = "Available Balance"
        label.textColor = UIColor(Color("lightLabelColor"))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.font = font
        label.text = "Recent Transactions"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See All", for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var allButton: UIButton = {
        let button = UIButton()
        button.setTitle("All", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var outflowsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Outflows", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var incomeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Income", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.green, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var optionsSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["All", "Incomes", "Outflows"])
        let rect = CGRect(x: 0.0, y: 0.0, width: 300, height: 30)
        segmentedControl.frame = rect
        
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.tintColor = .black
        segmentedControl.backgroundColor = .white
        
        //implementar o target dos botões da segmented control
        
        //segmentedControl.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        
        self.view.backgroundColor = UIColor(Color("backgroundColor"))
        
        self.view.addSubview(mainView)
        self.view.addSubview(balanceLabel)
        self.view.addSubview(tableView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(seeAllButton)
        self.view.addSubview(optionsSegmentedControl)
        self.view.addSubview(availableBalanceLabel)
        
        seeAllButton.addTarget(self, action: #selector(seeAllTransactionsButton), for: .touchUpInside)
        
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "TransactionsCell")
        
        NSLayoutConstraint.activate([
            
            mainView.heightAnchor.constraint(equalToConstant: 600),
            mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            
            balanceLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            balanceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            
            availableBalanceLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 8),
            availableBalanceLabel.leadingAnchor.constraint(equalTo: balanceLabel.leadingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22),
            
            //tirar estes botões e usar um segmented control
            seeAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            optionsSegmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            optionsSegmentedControl.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: optionsSegmentedControl.bottomAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 40)
        ])
    }
    
    @objc func seeAllTransactionsButton() {
        let vController = AddTransactionViewController()
        vController.modalPresentationStyle = .fullScreen
        present(vController, animated: true, completion: nil)
        
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsCell", for: indexPath) as? TransactionCell
          cell?.setup(transaction: transactions[indexPath.row])
          return cell ?? UITableViewCell()
          
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

