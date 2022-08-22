//
//  WeatherTodayView.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 10/08/22.
//

import UIKit

import SwiftUI

public class WeatherTodayView: UIView {
    
    lazy var weatherDataView: UIView = {
        let rect = CGRect(x: 0, y: 0, width: 300, height: 100)
        let weatherView = UIView(frame: .zero)
        weatherView.backgroundColor = UIColor(Color("weatherViewColor"))
        //weatherView.translatesAutoresizingMaskIntoConstraints = false
        
        return weatherView
    }()

    init() {
        let rect = CGRect(x: 0, y: 0, width: 200, height: 100)
        super.init(frame: rect)
        self.backgroundColor = .lightGray

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
