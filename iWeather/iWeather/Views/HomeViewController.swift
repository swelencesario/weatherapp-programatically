//
//  ViewController.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 10/08/22.
//

import UIKit
import CoreLocation
import MapKit
import SwiftUI

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private let homeView: HomeView = {
        let homeView = HomeView()
        
        return homeView
    }()
    
    var locationManager = CLLocationManager()
    
    var viewModel = HomeViewModel()
    
    var weatherResults = [ListViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        bindElements()
        //        navigationItem.title = "iWeather"
        //        navigationItem.backButtonTitle = ""
        self.view.backgroundColor = UIColor(Color("backgroundColor"))
    }
    
    private func initialSetup() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.identifier)
        
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
    
    private func bindElements() {
        viewModel.weatherResults.bind {[weak self] weatherResults in
            guard let weatherResults = weatherResults else { return }
            
            self?.weatherResults = weatherResults
            self?.homeView.dateLabel.text = self?.viewModel.customDate(weatherResults.first?.dt ?? 0)
            self?.homeView.dateLabel.text = self?.viewModel.customDate(weatherResults.first?.dt ?? 0)
            self?.homeView.weatherIcon.loadFrom(URLAddress: "https://openweathermap.org/img/wn/"+"\(weatherResults.first?.icon ?? "")"+"@2x.png")
            self?.homeView.tempLabel.text = (self?.weatherResults.first?.currentTemString ?? "") + "°C"
            self?.homeView.descriptionLabel.text = self?.weatherResults.first?.description
        }
    }
    
    override func loadView() {
        
        self.view = homeView
        
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as? ForecastTableViewCell
        cell?.setupCell(viewModel: weatherResults[indexPath.row])
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
}

extension HomeViewController: CLLocationManagerDelegate {
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = String(location.coordinate.latitude)
            let lon = String(location.coordinate.longitude)
            viewModel.getWeatherByCoreLocation(lon, lat)
        }
        let myLocation = CLLocation(latitude: locations.first?.coordinate.latitude ?? 0.0, longitude: locations.first?.coordinate.longitude ?? 0.0)
        myLocation.placemark{ placemark, error in
            guard let placemark = placemark else {
                return
            }
        
            self.homeView.locationLabel.text = placemark.locality
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension CLPlacemark {
    var city: String? { locality }
}

extension CLLocation {
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
}
