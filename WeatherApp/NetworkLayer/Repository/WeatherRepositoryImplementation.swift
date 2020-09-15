//
//  WeatherRepositoryImplementation.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

class WeatherRepositoryImplementation {
    
    var completionTask: URLSessionDataTask?

    private let apiKey = "5bfce4c015fa20a9c5c6d93ca4023767"
    private let decoder = JSONDecoder()
    private let session: URLSession
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    typealias ForecastWeatherCompletionHandler = (ForecastWeatherResponse?, Error?) -> Void
        
    private func baseUrl(_ suffixURL: SuffixURL, lat: String, long: String) -> URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/\(suffixURL.rawValue)?lat=\(lat)&lon=\(long)&APPID=\(self.apiKey)")!
    }

        
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
        
      private func getBaseRequest<T: Codable>(at lat: String,
                                                long: String,
                                                suffixURL: SuffixURL,
                                                completionHandler completion:  @escaping (_ object: T?,_ error: Error?) -> ()) {
            
            let url = baseUrl(suffixURL, lat: lat, long: long)
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data {
                        guard let httpResponse = response as? HTTPURLResponse else {
                            completion(nil, ResponseError.requestFailed)
                            return
                        }
                        
                        if httpResponse.statusCode == 200 {
                            do {
                                let weather = try self.decoder.decode(T.self, from: data)
                                completion(weather, nil)
                            } catch let error {
                                completion(nil, error)
                            }
                        } else {
                            completion(nil, ResponseError.invalidData)
                        }
                    } else if let error = error {
                        completion(nil, error)
                    }
                }
            }
            
            task.resume()
        }

    func getCurrentWeather(model: GetWeatherRequestModel, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getBaseRequest(at: model.lat, long: model.lon, suffixURL: .currentWeather) { (weather: CurrentWeather?, error) in
               completion(weather, error)
           }
       }
    
    func getForecastWeather(model: GetWeatherRequestModel, completionHandler completion: @escaping ForecastWeatherCompletionHandler) {
        getBaseRequest(at: model.lat, long: model.lon, suffixURL: .forecastWeather) { (weather: ForecastWeatherResponse?, error) in
               completion(weather, error)
           }
       }

}
