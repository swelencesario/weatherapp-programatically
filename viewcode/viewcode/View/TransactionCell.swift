//
//  TransactionsCell.swift
//  viewcode
//
//  Created by Swelen Poliana Cesario Ebert on 02/08/22.
//

import UIKit

public class TransactionCell: UITableViewCell {
    
    static let identifier: String = "TransactionCell"
    
    lazy var contentCell: UIView = {
        let rect = CGRect(x: 0.0, y: 0.0, width: 368, height: 64)
        let viewCell = UIView(frame: rect)
        viewCell.layer.cornerRadius = 12
        viewCell.backgroundColor = .white
        viewCell.translatesAutoresizingMaskIntoConstraints = false
        
        return viewCell
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.contentCell)
        self.backgroundColor = .clear
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    

    lazy var transactionIcon: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "cellIcon-1")
        image.backgroundColor = .green
        
        return image
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.font = font
        label.text = "Mercado"
        
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.font = font
        label.text = "Mini Extra"
        
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16.0)
        label.text = "- R$50,00"
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.font = font
        label.text = "Ago 13"
        
        return label
    }()
    
    func setup(transaction: Transaction) {
        self.transactionIcon.image = transaction.transactionIcon
        self.nameLabel.text = transaction.storeName
        self.typeLabel.text = transaction.transactionType
        self.valueLabel.text = String(transaction.transactionValue)
        self.dateLabel.text = transaction.transactionDate
        
        contentCell.addSubview(transactionIcon)
        contentCell.addSubview(nameLabel)
        contentCell.addSubview(typeLabel)
        contentCell.addSubview(valueLabel)
        contentCell.addSubview(dateLabel)
        
        contentCell.translatesAutoresizingMaskIntoConstraints = false
        transactionIcon.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //contentCell.heightAnchor.constraint(equalToConstant: 80),
            contentCell.widthAnchor.constraint(equalToConstant: 368),
            contentCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            transactionIcon.centerYAnchor.constraint(equalTo: contentCell.centerYAnchor),
            transactionIcon.heightAnchor.constraint(equalToConstant: 40),
            transactionIcon.widthAnchor.constraint(equalToConstant: 40),
            transactionIcon.leadingAnchor.constraint(equalTo: contentCell.leadingAnchor, constant: 10),
            
            typeLabel.topAnchor.constraint(equalTo: contentCell.topAnchor, constant: 20),
            typeLabel.leadingAnchor.constraint(equalTo: transactionIcon.trailingAnchor, constant: 16),
            
            nameLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 1),
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            
            valueLabel.trailingAnchor.constraint(equalTo: contentCell.trailingAnchor, constant: -20),
            valueLabel.topAnchor.constraint(equalTo: typeLabel.topAnchor),
            
            dateLabel.trailingAnchor.constraint(equalTo: valueLabel.trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            
        ])
    }
}
