//
//  ViewController.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 10/08/22.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private let homeView: HomeView = {
        let homeView = HomeView()
        
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
//        navigationItem.title = "iWeather"
//        navigationItem.backButtonTitle = ""
        self.view.backgroundColor = UIColor(Color("backgroundColor"))
    }
    
    private func initialSetup() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        configSubViews()
        configConstraints()
    }
    
    private func configSubViews() {
        self.view.addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: homeView.titleTableViewLabel.bottomAnchor, constant: 8),
        ])
    
    }
    override func loadView() {
        self.view = homeView
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return transactions.count
        return 1
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//          let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsCell", for: indexPath) as? TransactionCell
//          cell?.setup(transaction: transactions[indexPath.row])
          //return cell ?? UITableViewCell()
          return UITableViewCell()
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
