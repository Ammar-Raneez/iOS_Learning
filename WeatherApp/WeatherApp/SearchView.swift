//
//  SearchView.swift
//  WeatherApp
//
//  Created by Ammar on 2023-02-17.
//

import SwiftUI

struct SearchView: View {
    @State var cityName: String = "";
    @StateObject var networkStore = NetworkStore();
    
    let defaultValue: String = "----";
    
    let images: [String] = [
        "aqi.low",
        "thermometer.medium",
        "humidity",
        "tornado",
        "sunset.fill",
        "wind",
        "cloud.fill"
    ]
    let subtitles: [String] = [
        "Current Status",
        "Temperature",
        "Humidity",
        "Pressure",
        "Visibility",
        "Wind Speed",
        "Clouds (1%)"
    ]
//    let titles: [String] = [
//        "Broken Clouds",
//        "25.99 °C",
//        "64.0",
//        "1013.0",
//        "10000.0",
//        "3.01",
//        "68.0"
//    ]
    
    let gridColumns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width * 0.45)), GridItem(.fixed(UIScreen.main.bounds.width * 0.45)),
    ]

    func getTitle(type titleType: String) -> String {
        let tempWeatherObj = self.networkStore.weatherObj
        
        switch (titleType) {
        case subtitles[0]:
            return tempWeatherObj?.weather[0].description ?? self.defaultValue
        case subtitles[1]:
            return "\(tempWeatherObj?.main.temp == nil ? self.defaultValue : String(describing: tempWeatherObj!.main.temp)) °C"
        case subtitles[2]:
            return tempWeatherObj?.main.humidity == nil ? self.defaultValue : String(describing: tempWeatherObj!.main.humidity)
        case subtitles[3]:
            return tempWeatherObj?.main.pressure == nil ? self.defaultValue : String(describing: tempWeatherObj!.main.pressure)
        case subtitles[4]:
            return tempWeatherObj?.visibility == nil ? self.defaultValue : String(describing: tempWeatherObj!.visibility)
        case subtitles[5]:
            return tempWeatherObj?.wind.speed == nil ? self.defaultValue : String(describing: tempWeatherObj!.wind.speed)
        case subtitles[6]:
            return tempWeatherObj?.clouds.all == nil ? self.defaultValue : String(describing: tempWeatherObj!.clouds.all)
        default:
            return self.defaultValue
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Weather")
                .font(.largeTitle)
                .bold()
            HStack {
                TextField("City Name", text: self.$cityName)
                    .textFieldStyle(.roundedBorder)
                Button {
                    Task {
                        print("Fetch city weather")
                        if self.cityName.trimmingCharacters(in: [" "]) == "" {
                            print("Invalid city name")
                        } else {
                            await self.networkStore.fetchData(self.cityName)
                        }
                    }
                } label: {
                    Text("Search")
                }
            }
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 20) {
                    ForEach(0..<images.count, id: \.self) {
                        i in WeatherConditionView(
                            image: images[i],
                            title: getTitle(type: subtitles[i]),
                            subtitle: subtitles[i]
                        )
                    }
                }
            }
        }.padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct WeatherConditionView: View {
    var image: String;
    var title: String;
    var subtitle: String;

    var cardWidth: CGFloat = UIScreen.main.bounds.width * 0.45;
    var cardHeight: CGFloat = 200;
    var cardRadius: CGFloat = 30;
    var imgSize: CGFloat = 50;
    var titleSize: CGFloat = 24;
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: self.cardRadius)
                .frame(width: self.cardWidth, height: self.cardHeight)
                .foregroundColor(.gray)
                .opacity(0.4)
            VStack(spacing: 20) {
                Image(systemName: self.image)
                    .font(.system(size: self.imgSize))
                Text(self.title)
                    .font(.system(size: self.titleSize))
                    .bold()
                Text(self.subtitle)
            }
        }
    }
}
