//
//  WeatherRepositoryProtocol.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 22/08/22.
//

import Foundation

public protocol WeatherRepositoryProtocol {
    func fetchByLocal(local: String, completion: @escaping ([List]) -> ())
    func fetchByCoreLocation(longitude: String, latitude: String, completion: @escaping ([List]) -> ())
}
