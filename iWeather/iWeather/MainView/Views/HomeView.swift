//
//  HomeView.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 10/08/22.
//

import UIKit

class HomeView: UIView {

    
    
    //MARK: - Labels
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.font = font
        label.text = "May 4th, 2022"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nowLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo Regular 14.0", size: 10)
        label.textColor = .white
        //let font = UIFont.systemFont(ofSize: 12, weight: .regular)
        //label.font = font
        label.text = "NOW IN"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont(name: "Apple SD Gothic Neo Bold 18.0", size: 18)
        
        let font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.font = font
        label.textColor = .white
        label.text = "São Bernardo do Campo"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.font = font
        label.text = "16ºC"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.font = font
        label.text = "Cloudy"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var titleTableViewLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.font = font
        label.text = "5 DAYS FORECAST"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Buttons
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "magnifyingglass")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
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
        button.tintColor = .white
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
        button.tintColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(showCurrentLocationData), for: .touchUpInside)
        
        return button
    }()
    
    lazy var weatherIcon: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        image.contentMode = .scaleToFill
        image.image = UIImage(systemName: "cloud.rain")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
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
        self.addSubview(weatherIcon)
        self.addSubview(tempLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(titleTableViewLabel)
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
            self.nowLocationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            
            self.locationLabel.topAnchor.constraint(equalTo: nowLocationLabel.bottomAnchor, constant: 8),
            self.locationLabel.centerXAnchor.constraint(equalTo: nowLocationLabel.centerXAnchor),
            
            self.weatherIcon.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 16),
            self.weatherIcon.centerXAnchor.constraint(equalTo: locationLabel.centerXAnchor),
            self.weatherIcon.widthAnchor.constraint(equalToConstant: 40),
            self.weatherIcon.heightAnchor.constraint(equalToConstant: 40),
            
            self.tempLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 16),
            self.tempLabel.centerXAnchor.constraint(equalTo: weatherIcon.centerXAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 8),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: tempLabel.centerXAnchor),
            
            self.titleTableViewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            self.titleTableViewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
    
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
