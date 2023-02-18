//
//  NetworkStore.swift
//  WeatherApp
//
//  Created by Ammar on 2023-02-17.
//

import Foundation

class NetworkStore: ObservableObject {
    @Published var weatherObj: WeatherData?;
    
    private var BASE_URL = "https://api.openweathermap.org/data/2.5/weather?appid=\(Constants.API_KEY)&units=metric";
    
    func fetchData(_ cityName: String) async {
        let urlString = "\(self.BASE_URL)&q=\(cityName)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        
        // Create URL
        guard let url = URL(string: urlString) else {
            print("INVALID URL")
            return
        }

        do {
            // Create URLSession
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Create Decoder
            let weather = try JSONDecoder().decode(WeatherData.self, from: data)
            print(weather)
            DispatchQueue.main.async {
                self.weatherObj = weather
            }
        } catch {
            print(error)
        }
        
    }
}
