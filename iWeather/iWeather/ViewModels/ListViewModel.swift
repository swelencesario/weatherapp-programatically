//
//  ListViewModel.swift
//  iWeather
//
//  Created by Swelen Poliana Cesario Ebert on 22/08/22.
//

import Foundation

public class ListViewModel {
    
    var dt: Int
    var icon: String
    var temp_min: Double
    var temp_max: Double
    var temp: Double
    var description: String
    var dt_txt: String
    
    var weatherDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd"
        let dateFormatted = Date(timeIntervalSince1970: TimeInterval(dt))
        let weekday = dateFormatter.string(from: dateFormatted)
        
        return weekday
        //return Date(timeIntervalSince1970: TimeInterval(dt)).formatted(date: .abbreviated, time: .omitted)
        //return Date(timeIntervalSince1970: TimeInterval(dt)).formatted(.we)
    }
    
    var currentTemString:String {
        return String(format: "%.0f", temp)
    }
    
    var minTempString:String {
        return String(format: "%.0f", temp_min)
    }
    
    var maxTempString:String {
        return String(format: "%.0f", temp_max)
    }
    
    init(_ list: List) {
        dt = list.dt
        icon = list.weather.first?.icon ?? ""
        temp_min = list.main.temp_min
        temp_max = list.main.temp_max
        temp = list.main.temp
        description = list.weather.first?.description.capitalized ?? ""
        
        dt_txt = list.dt_txt
    }
}
