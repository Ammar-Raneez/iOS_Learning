//
//  Weather.swift
//  WeatherApp
//
//  Created by Ammar on 2023-02-17.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
    let clouds: Clouds
    let visibility: Int
    let wind: Wind
}

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Decodable {
    var temp: Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Int
    var humidity: Int
    var sea_level: Int
    var grnd_level: Int
}

struct Wind: Decodable {
    var speed: Float
    var deg: Int
    var gust: Float
}

struct Clouds: Decodable {
    var all: Int
}
