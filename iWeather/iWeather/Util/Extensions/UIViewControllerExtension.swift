//
//  UIViewControllerExtension.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 24/08/22.
//

import UIKit
import SwiftUI

extension UIViewController {
    
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "", preferredStyle: .alert)
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: alert.view.bounds.size.width - 0.0 * 4.0, height: 300))
        containerView.backgroundColor = UIColor(Color("backgroundColor"))
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .large
        indicator.center = view.center
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        alert.view.addSubview(containerView)
        containerView.addSubview(indicator)
        
        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve
        present(alert, animated: false, completion: nil)
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: -32),
            containerView.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: 35),
            containerView.heightAnchor.constraint(equalToConstant: 896),
            containerView.widthAnchor.constraint(equalToConstant: 414),
            
            indicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            ])
        
        return alert
    }
    
    func stopLoader(loader: UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
}

