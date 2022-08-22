//
//  ForecastTableViewCell.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 22/08/22.
//

import UIKit

public class ForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "forecastCell"
    
    lazy var contentCell: UIView = {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 368, height: 64)
        let viewCell = UIView(frame: rect)
        viewCell.layer.cornerRadius = 12
        viewCell.backgroundColor = .white
        viewCell.translatesAutoresizingMaskIntoConstraints = false
        
        return viewCell
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.font = font
        label.text = "Ago 13"
        label.textColor = .black
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.contentCell)
        self.backgroundColor = .blue
        
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell(model: Weather) {
        self.dateLabel.text = model.description
    }
    
    private func initialSetup() {
        configSubViews()
        configConstraints()
    }
    
    private func configSubViews() {
        self.addSubview(dateLabel)
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            contentCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            contentCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
}
