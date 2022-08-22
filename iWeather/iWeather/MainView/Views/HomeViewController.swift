//
//  ViewController.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 10/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView: HomeView = {
        let homeView = HomeView()
        
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = "iWeather"
//        navigationItem.backButtonTitle = ""
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        self.view = homeView
    }

}

