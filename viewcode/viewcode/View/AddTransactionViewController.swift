//
//  addTransactionViewController.swift
//  viewcode
//
//  Created by Swelen Poliana Cesario Ebert on 05/08/22.
//

import UIKit

class AddTransactionViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.font = font
        label.text = "Entradas"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        // Do any additional setup after loading the view.
    }

    private func setupLayout() {
        
        self.view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
        ])
    }


}
