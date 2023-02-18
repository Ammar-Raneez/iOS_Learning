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
    let titles: [String] = [
        "Broken Clouds",
        "25.99 °C",
        "64.0",
        "1013.0",
        "10000.0",
        "3.01",
        "68.0"
    ]
    
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
                        await self.networkStore.fetchData(self.cityName)
                    }
                } label: {
                    Text("Search")
                }
            }
            ScrollView {
                HStack {
                    WeatherConditionView(
                        image: images[0],
                        title: self.networkStore.weatherObj?.weather[0].description ?? self.defaultValue,
                        subtitle: subtitles[0]
                    )
                    WeatherConditionView(
                        image: images[1],
                        title: "\(self.networkStore.weatherObj?.main.temp == nil ? self.defaultValue : String(describing: self.networkStore.weatherObj!.main.temp)) °C",
                        subtitle: subtitles[1]
                    )
                }
                HStack {
                    WeatherConditionView(
                        image: images[2],
                        title: self.networkStore.weatherObj?.main.humidity == nil ? self.defaultValue : String(describing: self.networkStore.weatherObj!.main.humidity),
                        subtitle: subtitles[2]
                    )
                    WeatherConditionView(
                        image: images[3],
                        title: self.networkStore.weatherObj?.main.pressure == nil ? self.defaultValue : String(describing: self.networkStore.weatherObj!.main.pressure),
                        subtitle: subtitles[3]
                    )
                }
                HStack {
                    WeatherConditionView(
                        image: images[4],
                        title: self.networkStore.weatherObj?.visibility == nil ? self.defaultValue : String(describing: self.networkStore.weatherObj!.visibility),
                        subtitle: subtitles[4]
                    )
                    WeatherConditionView(
                        image: images[5],
                        title: self.networkStore.weatherObj?.wind.speed == nil ? self.defaultValue : String(describing: self.networkStore.weatherObj!.wind.speed),
                        subtitle: subtitles[5]
                    )
                }
                HStack {
                    WeatherConditionView(
                        image: images[6],
                        title: self.networkStore.weatherObj?.clouds.all == nil ? self.defaultValue : String(describing: self.networkStore.weatherObj!.clouds.all),
                        subtitle: subtitles[6]
                    )
                    Spacer()
                }

//                ForEach(0..<images.count, id: \.self) {
//                    i in Group {
//                        if i % 2 == 0 {
//                            HStack {
//                                WeatherConditionView(
//                                    image: images[i],
//                                    title: titles[i],
//                                    subtitle: subtitles[i]
//                                )
//                            }
//                        } else {
//                            WeatherConditionView(
//                                image: images[i],
//                                title: titles[i],
//                                subtitle: subtitles[i]
//                            )
//                        }
//                    }
//                }
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
