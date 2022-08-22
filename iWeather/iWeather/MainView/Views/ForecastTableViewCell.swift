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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.contentCell)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
