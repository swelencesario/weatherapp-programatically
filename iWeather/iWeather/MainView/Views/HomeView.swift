//
//  HomeView.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 10/08/22.
//

import UIKit

class HomeView: UIView {

    lazy var weatherTodayView: WeatherTodayView = {
        let todayView = WeatherTodayView()
        todayView.translatesAutoresizingMaskIntoConstraints = false
        return todayView
    }()
    
    //MARK: - Labels
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.font = font
        label.text = "Wednesday, May 4th, 2022"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nowLocationLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.font = font
        label.text = "NOW IN YOUR CURRENT LOCATION"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.font = font
        label.text = "Current Location Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Buttons
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "magnifyingglass")
        button.setImage(image, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(searchByCity), for: .touchUpInside)
        
        return button
    }()
    
    lazy var starButton: UIButton = {
        let button = UIButton()
        let imageStarNormal = UIImage(systemName: "star")
        let imageStarSelected = UIImage(systemName: "star.fill")
        button.setImage(imageStarNormal, for: .normal)
        button.setImage(imageStarSelected, for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
        
        return button
    }()
    
    lazy var currentLocationButton: UIButton = {
        let button = UIButton()
        let imageNormalState = UIImage(systemName: "circle")
        let imageSelectedState = UIImage(named: "circle.fill")
        button.setImage(imageNormalState, for: .normal)
        button.setImage(imageSelectedState, for: .selected)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(showCurrentLocationData), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Inits
    
    init() {

        super.init(frame: .zero)
        
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Métodos
    
    private func setupViews() {
        configureSubViews()
        setupConstraints()
    }
    
    private func configureSubViews() {
        self.addSubview(dateLabel)
        self.addSubview(searchButton)
        self.addSubview(starButton)
        self.addSubview(currentLocationButton)
        self.addSubview(nowLocationLabel)
        self.addSubview(locationLabel)
        self.addSubview(weatherTodayView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([

            self.dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.dateLabel.centerYAnchor.constraint(equalTo: currentLocationButton.centerYAnchor),
            
            self.searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            
            self.starButton.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor),
            self.starButton.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -8),
            
            self.currentLocationButton.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor),
            self.currentLocationButton.trailingAnchor.constraint(equalTo: starButton.leadingAnchor, constant: -8),
            
            self.nowLocationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nowLocationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 30),
            
            self.locationLabel.topAnchor.constraint(equalTo: nowLocationLabel.bottomAnchor, constant: 8),
            self.locationLabel.centerXAnchor.constraint(equalTo: nowLocationLabel.centerXAnchor),
    
            self.weatherTodayView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            ])
    }
    
    //MARK: - Button Actions
    
    @objc func addToFavorites() {
        
    }
    
    @objc func showCurrentLocationData() {
        
    }
    
    @objc func searchByCity() {
        
    }

}
