//
//  ForecastTableViewCell.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 22/08/22.
//

import UIKit
import SwiftUI

public class ForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "forecastCell"
    
    lazy var contentCell: UIView = {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 368, height: 64)
        let viewCell = UIView(frame: rect)
        viewCell.layer.cornerRadius = 12
        viewCell.backgroundColor = UIColor(Color("cellColor"))
        viewCell.layer.shadowColor = UIColor.black.cgColor
        viewCell.layer.shadowOpacity = 0.2
        viewCell.layer.shadowOffset = CGSize(width: 0, height: 5)
        viewCell.layer.shadowRadius = 1
        
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
    
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.font = font
        label.text = "Ago 13"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var weatherIcon: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        image.contentMode = .scaleToFill
        image.image = UIImage(systemName: "cloud.rain")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var highTempLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.font = font
        label.text = "Ago 13"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.font = font
        label.text = "Ago 13"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var highAndLowTempStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(highTempLabel)
        stackView.addArrangedSubview(lowTempLabel)
        
        return stackView
    }()
    
    func setupCell(viewModel: ListViewModel) {
        self.dateLabel.text = viewModel.weatherDate
        self.weatherIcon.loadFrom(URLAddress: "https://openweathermap.org/img/wn/"+"\(viewModel.icon)"+"@2x.png")
        self.highTempLabel.text = "H: " + viewModel.maxTempString + "°C"
        self.lowTempLabel.text = "L: " + viewModel.minTempString + "°C"
        
        initialSetup()
    }
    
    private func initialSetup() {
        configSubViews()
        configConstraints()
    }
    
    private func configSubViews() {
        contentCell.addSubview(dateLabel)
        contentCell.addSubview(weatherIcon)
        contentCell.addSubview(highAndLowTempStackView)
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            contentCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            contentCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            dateLabel.leadingAnchor.constraint(equalTo: contentCell.leadingAnchor, constant: 8),
            dateLabel.centerYAnchor.constraint(equalTo: contentCell.centerYAnchor),
            
            //weatherIcon.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 8),
            weatherIcon.centerYAnchor.constraint(equalTo: contentCell.centerYAnchor),
            weatherIcon.centerXAnchor.constraint(equalTo: contentCell.centerXAnchor),
            
            highAndLowTempStackView.centerYAnchor.constraint(equalTo: contentCell.centerYAnchor),
            highAndLowTempStackView.trailingAnchor.constraint(equalTo: contentCell.trailingAnchor, constant: -8)
        ])
    }
}
